import 'package:flutter/material.dart';

String resourceName(String key) {
  const map = {
    'wood': 'Дерево',
    'twig': 'Веточка',
    'log': 'Бревно',
    'mystic_wood': 'Дух-древесина',
    'spirit_wood': 'Дух-древесина',
    'frozen_wood': 'Мерзлая древесина',
    'frozen_plank': 'Мерзлая доска',
    'runic_plank': 'Рунная доска',
    'rusty_plank': 'Ржавая доска',
    'wooden_plank': 'Деревянная доска',
    'treated_leather': 'Обработанная кожа',
    'stone': 'Камень',
    'stone_block': 'Каменный блок',
    'flint': 'Кремень',
    'clay': 'Глина',
    'iron': 'Железо',
    'iron_ore': 'Железная руда',
    'iron_ingot': 'Железный слиток',
    'silver_ore': 'Серебряная руда',
    'silver_ingot': 'Серебряный слиток',
    'frost_ore': 'Морозная руда',
    'frost_ingot': 'Морозный слиток',
    'rust': 'Ржавчина',
    'rusty_iron': 'Ржавое железо',
    'coal': 'Уголь',
    'acid_steel': 'Кислотная сталь',
    'arcane_ingot': 'Магический слиток',
    'leather': 'Кожа',
    'leather_strip': 'Полоска кожи',
    'hide': 'Шкура',
    'snow_leather': 'Снежная кожа',
    'fiber': 'Волокно',
    'fabric': 'Ткань',
    'ice_cloth': 'Ледяная ткань',
    'star_cloth': 'Звездная ткань',
    'enchanted_cloth': 'Зачарованная ткань',
    'bone': 'Кость',
    'feather': 'Перо',
    'acid_gland': 'Кислотная железа',
    'gem': 'Самоцвет',
    'herbs': 'Травы',
    'resin': 'Смола',
    'magic_essence': 'Эссенция магии',
    'mana_crystal': 'Кристалл маны',
    'moon_water': 'Лунная вода',
    'lake_water': 'Вода озера',
    'coral': 'Коралл',
    'ice_crystal': 'Ледяной кристалл',
    'void_shard': 'Осколок пустоты',
    'stardust': 'Звездная пыль',
    'star_dust': 'Звездная пыль',
    'enchant_dust': 'Пыль зачарования',
    'ancient_scroll': 'Древний свиток',
    'rope': 'Верёвка',
    'torch': 'Факел',
    'wooden_bow': 'Деревянный лук',
    'stone_axe': 'Каменный топор',
    'flint_dagger': 'Кремнёвый кинжал',
    'cloth_cap': 'Тканевая шапка',
    'clay_pot': 'Глиняный горшок',
  };
  return map[key] ?? key;
}

IconData getResourceIcon(String key) {
  if (key.contains('wood') || key.contains('twig') || key.contains('log') || key.contains('plank') || key.contains('resin')) {
    return Icons.park;
  }
  if (key.contains('stone') || key.contains('ore') || key.contains('flint') || key.contains('clay') || key.contains('rust')) {
    return Icons.landscape;
  }
  if (key.contains('iron') || key.contains('steel') || key.contains('ingot')) {
    return Icons.hardware;
  }
  if (key.contains('leather') || key.contains('cloth') || key.contains('fabric') || key.contains('fiber') || key.contains('hide')) {
    return Icons.checkroom;
  }
  if (key.contains('crystal') || key.contains('shard') || key.contains('dust') || key.contains('essence') || key.contains('gem')) {
    return Icons.diamond;
  }
  if (key.contains('herb') || key.contains('water') || key.contains('coral') || key.contains('gland')) {
    return Icons.local_florist;
  }
  if (key.contains('scroll')) {
    return Icons.menu_book;
  }
  return Icons.backpack; 
}