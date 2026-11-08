import 'dart:ui';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../services/session.dart';
import '../ui_kit.dart';

class ClanInfoScreen extends StatefulWidget {
  final int clanId;
  const ClanInfoScreen({super.key, required this.clanId});

  @override
  State<ClanInfoScreen> createState() => _ClanInfoScreenState();
}

class _ClanInfoScreenState extends State<ClanInfoScreen> {
  Map<String, dynamic>? _clanInfo;
  List<Map<String, dynamic>> _members = [];
  bool _loading = true;
  int _myGold = 0;
  bool _isMyClan = false;

  final Color bronze = const Color(0xFF8B7D6B);

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final charId = Session.characterId;
    if (charId == null) return;

    setState(() => _loading = true);
    try {
      final resp = await apiClient.getClanInfo(widget.clanId);
      final charResp = await apiClient.getCharacter(charId);

      if (resp['success'] == true) {
        final myClanId = (charResp['clan_id'] as num?)?.toInt() ?? 0;
        
        if (mounted) {
          setState(() {
            _clanInfo = resp;
            final rawMembers = (resp['members'] as List<dynamic>?) ?? [];
            _members = rawMembers.cast<Map<String, dynamic>>();
            _myGold = (charResp['gold'] as num?)?.toInt() ?? 0;
            _isMyClan = (myClanId == widget.clanId);
            _loading = false;
          });
        }
      } else {
        if (mounted) setState(() => _loading = false);
      }
    } catch (e) {
      debugPrint('Clan load error: $e');
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _deposit(int amount) async {
    final charId = Session.characterId;
    if (charId == null) return;

    if (_myGold < amount) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Недостаточно золота!'), backgroundColor: Colors.redAccent),
        );
      }
      return;
    }

    try {
      final resp = await apiClient.depositClanGold(charId, amount);
      if (resp['success'] == true) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Золото внесено в банк клана!'), backgroundColor: Colors.green),
          );
        }
        _load();
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resp['message'] ?? 'Ошибка'), backgroundColor: Colors.redAccent),
          );
        }
      }
    } catch (e) {
      debugPrint('Deposit error: $e');
    }
  }

  Future<void> _buyBuff(String code) async {
    final charId = Session.characterId;
    if (charId == null) return;

    try {
      final resp = await apiClient.buyClanBuff(charId, code);
      if (resp['success'] == true) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Бафф клана активирован!'), backgroundColor: Colors.green),
          );
        }
        _load();
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resp['message'] ?? 'Ошибка'), backgroundColor: Colors.redAccent),
          );
        }
      }
    } catch (e) {
      debugPrint('Buy buff error: $e');
    }
  }

  Widget _buildHeroAvatar(String? classType, String leaderName, String memberName) {
    String heroImage = 'assets/images/warrior.png';
    Color classColor = Colors.redAccent;

    if (classType == 'mage') { heroImage = 'assets/images/mage.png'; classColor = Colors.blueAccent; }
    if (classType == 'bard') { heroImage = 'assets/images/bard.png'; classColor = Colors.purpleAccent; }
    if (classType == 'alchemist') { heroImage = 'assets/images/alchemist.png'; classColor = Colors.amberAccent; }

    final isLeader = memberName == leaderName;

    return Stack(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: isLeader ? Colors.amber : classColor, width: 2),
            image: DecorationImage(
              image: AssetImage(heroImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (isLeader)
          const Positioned(
            right: 0,
            bottom: 0,
            child: Icon(Icons.star, color: Colors.amber, size: 16),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameTheme.deepBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: GameTheme.sandGold),
        title: Text(
          _clanInfo != null ? 'КЛАН: ${_clanInfo!['name']}' : 'КЛАН', 
          style: TextStyle(fontFamily: 'Neucha', color: GameTheme.sandGold, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
  child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0), 
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 22, 22, 24).withOpacity(0.7),
            GameTheme.twilightPurple.withOpacity(0.85),
          ],
        ),
      ),
    ),
  ),
),

          SafeArea(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 800),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1A19),
                  border: Border.all(color: bronze, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _loading 
                    ? const Center(child: CircularProgressIndicator(color: GameTheme.sandGold))
                    : _clanInfo == null 
                        ? const Center(child: Text('Клан не найден', style: TextStyle(color: Colors.grey)))
                        : SingleChildScrollView(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (_isMyClan) ...[
                                  _buildBankCard(),
                                  const SizedBox(height: 24),
                                  _buildBuffsCard(),
                                  const SizedBox(height: 24),
                                ],
                                
                                Text(
                                  'УЧАСТНИКИ КЛАНА (${_members.length})', 
                                  style: TextStyle(color: bronze, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2),
                                ),
                                const SizedBox(height: 12),
                                
                                if (_members.isEmpty)
                                  const Text('Нет участников', style: TextStyle(color: Colors.grey))
                                else
                                  ..._members.map((m) {
                                    final isLeader = m['name'] == _clanInfo!['leader_name'];
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      decoration: BoxDecoration(
                                        color: isLeader ? GameTheme.twilightPurple.withOpacity(0.3) : const Color(0xFF11100F).withOpacity(0.6),
                                        border: Border.all(color: isLeader ? GameTheme.sandGold.withOpacity(0.5) : bronze.withOpacity(0.2)),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        children: [
                                          _buildHeroAvatar(
                                            m['class_type'] as String?, 
                                            _clanInfo!['leader_name'] as String, 
                                            m['name'] as String
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  m['name'] as String? ?? 'Unknown',
                                                  style: TextStyle(
                                                    fontFamily: 'Neucha', 
                                                    fontSize: 18, 
                                                    fontWeight: FontWeight.bold,
                                                    color: isLeader ? GameTheme.sandGold : GameTheme.lightSand,
                                                  ),
                                                ),
                                                Text(
                                                  'Уровень: ${m['level'] ?? 0}',
                                                  style: TextStyle(fontSize: 12, color: bronze),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (isLeader)
                                            const Text('ЛИДЕР', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 12)),
                                        ],
                                      ),
                                    );
                                  }),
                              ],
                            ),
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBankCard() {
    final bankGold = (_clanInfo!['bank_gold'] as num?)?.toInt() ?? 0;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF11100F),
        border: Border.all(color: bronze.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.account_balance, color: GameTheme.sandGold),
              SizedBox(width: 10),
              Text('КЛАНОВЫЙ БАНК', style: TextStyle(color: GameTheme.sandGold, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Баланс клана:', style: TextStyle(color: bronze, fontSize: 16)),
              Text('$bankGold', style: const TextStyle(color: GameTheme.sandGold, fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ваше золото:', style: TextStyle(color: bronze, fontSize: 14)),
              Text('$_myGold', style: const TextStyle(color: GameTheme.lightSand, fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _deposit(100),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GameTheme.sandGold,
                    foregroundColor: const Color(0xFF1C1A19),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  child: const Text('ВНЕСТИ 100', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _deposit(1000),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GameTheme.sandGold,
                    foregroundColor: const Color(0xFF1C1A19),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  child: const Text('ВНЕСТИ 1000', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBuffsCard() {
    final bankGold = (_clanInfo!['bank_gold'] as num?)?.toInt() ?? 0;
    final activeBuff = _clanInfo!['active_buff'] as String? ?? '';
    final buffExpires = (_clanInfo!['buff_expires_at'] as num?)?.toInt() ?? 0;
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final isBuffActive = buffExpires > now;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF11100F),
        border: Border.all(color: bronze.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.auto_awesome, color: GameTheme.sandGold),
              SizedBox(width: 10),
              Text('БАФФЫ КЛАНА', style: TextStyle(color: GameTheme.sandGold, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1)),
            ],
          ),
          if (isBuffActive) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.1),
                border: Border.all(color: Colors.greenAccent.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Активен: $activeBuff', style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                  Text('Осталось: ${(buffExpires - now) ~/ 3600} ч.', style: TextStyle(color: bronze, fontSize: 12)),
                ],
              ),
            ),
          ],
          const SizedBox(height: 20),
          
          _buildBuffRow(
            '+20% к Опыту (24ч)', 
            'Стоимость: 10,000 золота клана', 
            bankGold >= 10000 && !isBuffActive,
            () => _buyBuff('exp_boost'),
          ),
          Divider(color: bronze.withOpacity(0.2), height: 24),
          _buildBuffRow(
            '+20% к Золоту (24ч)', 
            'Стоимость: 15,000 золота клана', 
            bankGold >= 15000 && !isBuffActive,
            () => _buyBuff('gold_boost'),
          ),
        ],
      ),
    );
  }

  Widget _buildBuffRow(String title, String subtitle, bool canBuy, VoidCallback onBuy) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: GameTheme.lightSand, fontSize: 16, fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(color: bronze, fontSize: 12)),
            ],
          ),
        ),
        SizedBox(
          height: 35,
          child: ElevatedButton(
            onPressed: canBuy ? onBuy : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: GameTheme.twilightPurple,
              foregroundColor: GameTheme.sandGold,
              side: BorderSide(color: GameTheme.sandGold.withOpacity(0.5)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              disabledBackgroundColor: Colors.grey.shade900,
              disabledForegroundColor: Colors.grey.shade700,
            ),
            child: const Text('КУПИТЬ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}