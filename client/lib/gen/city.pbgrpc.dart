// This is a generated file - do not edit.
//
// Generated from city.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'city.pb.dart' as $0;

export 'city.pb.dart';

@$pb.GrpcServiceName('city.CityService')
class CityServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  CityServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetCityResponse> getCity(
    $0.GetCityRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getCity, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpgradeBuildingResponse> upgradeBuilding(
    $0.UpgradeBuildingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$upgradeBuilding, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetFoodRecipesResponse> getFoodRecipes(
    $0.GetFoodRecipesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getFoodRecipes, request, options: options);
  }

  $grpc.ResponseFuture<$0.BuyFoodResponse> buyFood(
    $0.BuyFoodRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$buyFood, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPotionRecipesResponse> getPotionRecipes(
    $0.GetPotionRecipesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getPotionRecipes, request, options: options);
  }

  $grpc.ResponseFuture<$0.DrinkPotionResponse> drinkPotion(
    $0.DrinkPotionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$drinkPotion, request, options: options);
  }

  $grpc.ResponseFuture<$0.StartBarracksResponse> startBarracks(
    $0.StartBarracksRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$startBarracks, request, options: options);
  }

  $grpc.ResponseFuture<$0.ClaimBarracksResponse> claimBarracks(
    $0.ClaimBarracksRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$claimBarracks, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRaidLogsResponse> getRaidLogs(
    $0.GetRaidLogsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getRaidLogs, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetLeaderboardResponse> getLeaderboard(
    $0.GetLeaderboardRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getLeaderboard, request, options: options);
  }

  $grpc.ResponseFuture<$0.SearchPlayerResponse> searchPlayer(
    $0.SearchPlayerRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$searchPlayer, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddFriendResponse> addFriend(
    $0.AddFriendRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addFriend, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetFriendsResponse> getFriends(
    $0.GetFriendsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getFriends, request, options: options);
  }

  $grpc.ResponseFuture<$0.AcceptFriendResponse> acceptFriend(
    $0.AcceptFriendRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$acceptFriend, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateClanResponse> createClan(
    $0.CreateClanRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createClan, request, options: options);
  }

  $grpc.ResponseFuture<$0.JoinClanResponse> joinClan(
    $0.JoinClanRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$joinClan, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetClanInfoResponse> getClanInfo(
    $0.GetClanInfoRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getClanInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.SearchClanResponse> searchClan(
    $0.SearchClanRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$searchClan, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetClanLeaderboardResponse> getClanLeaderboard(
    $0.GetClanLeaderboardRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getClanLeaderboard, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateCoopGroupResponse> createCoopGroup(
    $0.CreateCoopGroupRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createCoopGroup, request, options: options);
  }

  $grpc.ResponseFuture<$0.JoinCoopGroupResponse> joinCoopGroup(
    $0.JoinCoopGroupRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$joinCoopGroup, request, options: options);
  }

  $grpc.ResponseFuture<$0.LeaveCoopGroupResponse> leaveCoopGroup(
    $0.LeaveCoopGroupRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$leaveCoopGroup, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetCoopGroupResponse> getCoopGroup(
    $0.GetCoopGroupRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getCoopGroup, request, options: options);
  }

  $grpc.ResponseFuture<$0.SetReadyResponse> setReady(
    $0.SetReadyRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$setReady, request, options: options);
  }

  $grpc.ResponseFuture<$0.DepositClanGoldResponse> depositClanGold(
    $0.DepositClanGoldRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$depositClanGold, request, options: options);
  }

  $grpc.ResponseFuture<$0.BuyClanBuffResponse> buyClanBuff(
    $0.BuyClanBuffRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$buyClanBuff, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPlayerProfileResponse> getPlayerProfile(
    $0.GetPlayerProfileRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getPlayerProfile, request, options: options);
  }

  $grpc.ResponseFuture<$0.FindRaidTargetResponse> findRaidTarget(
    $0.FindRaidTargetRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$findRaidTarget, request, options: options);
  }

  $grpc.ResponseFuture<$0.AttackPlayerResponse> attackPlayer(
    $0.AttackPlayerRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$attackPlayer, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAchievementsResponse> getAchievements(
    $0.GetAchievementsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAchievements, request, options: options);
  }

  $grpc.ResponseFuture<$0.CheatGiveAllResponse> cheatGiveAll(
    $0.CheatGiveAllRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$cheatGiveAll, request, options: options);
  }

  // method descriptors

  static final _$getCity =
      $grpc.ClientMethod<$0.GetCityRequest, $0.GetCityResponse>(
          '/city.CityService/GetCity',
          ($0.GetCityRequest value) => value.writeToBuffer(),
          $0.GetCityResponse.fromBuffer);
  static final _$upgradeBuilding =
      $grpc.ClientMethod<$0.UpgradeBuildingRequest, $0.UpgradeBuildingResponse>(
          '/city.CityService/UpgradeBuilding',
          ($0.UpgradeBuildingRequest value) => value.writeToBuffer(),
          $0.UpgradeBuildingResponse.fromBuffer);
  static final _$getFoodRecipes =
      $grpc.ClientMethod<$0.GetFoodRecipesRequest, $0.GetFoodRecipesResponse>(
          '/city.CityService/GetFoodRecipes',
          ($0.GetFoodRecipesRequest value) => value.writeToBuffer(),
          $0.GetFoodRecipesResponse.fromBuffer);
  static final _$buyFood =
      $grpc.ClientMethod<$0.BuyFoodRequest, $0.BuyFoodResponse>(
          '/city.CityService/BuyFood',
          ($0.BuyFoodRequest value) => value.writeToBuffer(),
          $0.BuyFoodResponse.fromBuffer);
  static final _$getPotionRecipes = $grpc.ClientMethod<
          $0.GetPotionRecipesRequest, $0.GetPotionRecipesResponse>(
      '/city.CityService/GetPotionRecipes',
      ($0.GetPotionRecipesRequest value) => value.writeToBuffer(),
      $0.GetPotionRecipesResponse.fromBuffer);
  static final _$drinkPotion =
      $grpc.ClientMethod<$0.DrinkPotionRequest, $0.DrinkPotionResponse>(
          '/city.CityService/DrinkPotion',
          ($0.DrinkPotionRequest value) => value.writeToBuffer(),
          $0.DrinkPotionResponse.fromBuffer);
  static final _$startBarracks =
      $grpc.ClientMethod<$0.StartBarracksRequest, $0.StartBarracksResponse>(
          '/city.CityService/StartBarracks',
          ($0.StartBarracksRequest value) => value.writeToBuffer(),
          $0.StartBarracksResponse.fromBuffer);
  static final _$claimBarracks =
      $grpc.ClientMethod<$0.ClaimBarracksRequest, $0.ClaimBarracksResponse>(
          '/city.CityService/ClaimBarracks',
          ($0.ClaimBarracksRequest value) => value.writeToBuffer(),
          $0.ClaimBarracksResponse.fromBuffer);
  static final _$getRaidLogs =
      $grpc.ClientMethod<$0.GetRaidLogsRequest, $0.GetRaidLogsResponse>(
          '/city.CityService/GetRaidLogs',
          ($0.GetRaidLogsRequest value) => value.writeToBuffer(),
          $0.GetRaidLogsResponse.fromBuffer);
  static final _$getLeaderboard =
      $grpc.ClientMethod<$0.GetLeaderboardRequest, $0.GetLeaderboardResponse>(
          '/city.CityService/GetLeaderboard',
          ($0.GetLeaderboardRequest value) => value.writeToBuffer(),
          $0.GetLeaderboardResponse.fromBuffer);
  static final _$searchPlayer =
      $grpc.ClientMethod<$0.SearchPlayerRequest, $0.SearchPlayerResponse>(
          '/city.CityService/SearchPlayer',
          ($0.SearchPlayerRequest value) => value.writeToBuffer(),
          $0.SearchPlayerResponse.fromBuffer);
  static final _$addFriend =
      $grpc.ClientMethod<$0.AddFriendRequest, $0.AddFriendResponse>(
          '/city.CityService/AddFriend',
          ($0.AddFriendRequest value) => value.writeToBuffer(),
          $0.AddFriendResponse.fromBuffer);
  static final _$getFriends =
      $grpc.ClientMethod<$0.GetFriendsRequest, $0.GetFriendsResponse>(
          '/city.CityService/GetFriends',
          ($0.GetFriendsRequest value) => value.writeToBuffer(),
          $0.GetFriendsResponse.fromBuffer);
  static final _$acceptFriend =
      $grpc.ClientMethod<$0.AcceptFriendRequest, $0.AcceptFriendResponse>(
          '/city.CityService/AcceptFriend',
          ($0.AcceptFriendRequest value) => value.writeToBuffer(),
          $0.AcceptFriendResponse.fromBuffer);
  static final _$createClan =
      $grpc.ClientMethod<$0.CreateClanRequest, $0.CreateClanResponse>(
          '/city.CityService/CreateClan',
          ($0.CreateClanRequest value) => value.writeToBuffer(),
          $0.CreateClanResponse.fromBuffer);
  static final _$joinClan =
      $grpc.ClientMethod<$0.JoinClanRequest, $0.JoinClanResponse>(
          '/city.CityService/JoinClan',
          ($0.JoinClanRequest value) => value.writeToBuffer(),
          $0.JoinClanResponse.fromBuffer);
  static final _$getClanInfo =
      $grpc.ClientMethod<$0.GetClanInfoRequest, $0.GetClanInfoResponse>(
          '/city.CityService/GetClanInfo',
          ($0.GetClanInfoRequest value) => value.writeToBuffer(),
          $0.GetClanInfoResponse.fromBuffer);
  static final _$searchClan =
      $grpc.ClientMethod<$0.SearchClanRequest, $0.SearchClanResponse>(
          '/city.CityService/SearchClan',
          ($0.SearchClanRequest value) => value.writeToBuffer(),
          $0.SearchClanResponse.fromBuffer);
  static final _$getClanLeaderboard = $grpc.ClientMethod<
          $0.GetClanLeaderboardRequest, $0.GetClanLeaderboardResponse>(
      '/city.CityService/GetClanLeaderboard',
      ($0.GetClanLeaderboardRequest value) => value.writeToBuffer(),
      $0.GetClanLeaderboardResponse.fromBuffer);
  static final _$createCoopGroup =
      $grpc.ClientMethod<$0.CreateCoopGroupRequest, $0.CreateCoopGroupResponse>(
          '/city.CityService/CreateCoopGroup',
          ($0.CreateCoopGroupRequest value) => value.writeToBuffer(),
          $0.CreateCoopGroupResponse.fromBuffer);
  static final _$joinCoopGroup =
      $grpc.ClientMethod<$0.JoinCoopGroupRequest, $0.JoinCoopGroupResponse>(
          '/city.CityService/JoinCoopGroup',
          ($0.JoinCoopGroupRequest value) => value.writeToBuffer(),
          $0.JoinCoopGroupResponse.fromBuffer);
  static final _$leaveCoopGroup =
      $grpc.ClientMethod<$0.LeaveCoopGroupRequest, $0.LeaveCoopGroupResponse>(
          '/city.CityService/LeaveCoopGroup',
          ($0.LeaveCoopGroupRequest value) => value.writeToBuffer(),
          $0.LeaveCoopGroupResponse.fromBuffer);
  static final _$getCoopGroup =
      $grpc.ClientMethod<$0.GetCoopGroupRequest, $0.GetCoopGroupResponse>(
          '/city.CityService/GetCoopGroup',
          ($0.GetCoopGroupRequest value) => value.writeToBuffer(),
          $0.GetCoopGroupResponse.fromBuffer);
  static final _$setReady =
      $grpc.ClientMethod<$0.SetReadyRequest, $0.SetReadyResponse>(
          '/city.CityService/SetReady',
          ($0.SetReadyRequest value) => value.writeToBuffer(),
          $0.SetReadyResponse.fromBuffer);
  static final _$depositClanGold =
      $grpc.ClientMethod<$0.DepositClanGoldRequest, $0.DepositClanGoldResponse>(
          '/city.CityService/DepositClanGold',
          ($0.DepositClanGoldRequest value) => value.writeToBuffer(),
          $0.DepositClanGoldResponse.fromBuffer);
  static final _$buyClanBuff =
      $grpc.ClientMethod<$0.BuyClanBuffRequest, $0.BuyClanBuffResponse>(
          '/city.CityService/BuyClanBuff',
          ($0.BuyClanBuffRequest value) => value.writeToBuffer(),
          $0.BuyClanBuffResponse.fromBuffer);
  static final _$getPlayerProfile = $grpc.ClientMethod<
          $0.GetPlayerProfileRequest, $0.GetPlayerProfileResponse>(
      '/city.CityService/GetPlayerProfile',
      ($0.GetPlayerProfileRequest value) => value.writeToBuffer(),
      $0.GetPlayerProfileResponse.fromBuffer);
  static final _$findRaidTarget =
      $grpc.ClientMethod<$0.FindRaidTargetRequest, $0.FindRaidTargetResponse>(
          '/city.CityService/FindRaidTarget',
          ($0.FindRaidTargetRequest value) => value.writeToBuffer(),
          $0.FindRaidTargetResponse.fromBuffer);
  static final _$attackPlayer =
      $grpc.ClientMethod<$0.AttackPlayerRequest, $0.AttackPlayerResponse>(
          '/city.CityService/AttackPlayer',
          ($0.AttackPlayerRequest value) => value.writeToBuffer(),
          $0.AttackPlayerResponse.fromBuffer);
  static final _$getAchievements =
      $grpc.ClientMethod<$0.GetAchievementsRequest, $0.GetAchievementsResponse>(
          '/city.CityService/GetAchievements',
          ($0.GetAchievementsRequest value) => value.writeToBuffer(),
          $0.GetAchievementsResponse.fromBuffer);
  static final _$cheatGiveAll =
      $grpc.ClientMethod<$0.CheatGiveAllRequest, $0.CheatGiveAllResponse>(
          '/city.CityService/CheatGiveAll',
          ($0.CheatGiveAllRequest value) => value.writeToBuffer(),
          $0.CheatGiveAllResponse.fromBuffer);
}

@$pb.GrpcServiceName('city.CityService')
abstract class CityServiceBase extends $grpc.Service {
  $core.String get $name => 'city.CityService';

  CityServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetCityRequest, $0.GetCityResponse>(
        'GetCity',
        getCity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetCityRequest.fromBuffer(value),
        ($0.GetCityResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpgradeBuildingRequest,
            $0.UpgradeBuildingResponse>(
        'UpgradeBuilding',
        upgradeBuilding_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpgradeBuildingRequest.fromBuffer(value),
        ($0.UpgradeBuildingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetFoodRecipesRequest,
            $0.GetFoodRecipesResponse>(
        'GetFoodRecipes',
        getFoodRecipes_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetFoodRecipesRequest.fromBuffer(value),
        ($0.GetFoodRecipesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BuyFoodRequest, $0.BuyFoodResponse>(
        'BuyFood',
        buyFood_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BuyFoodRequest.fromBuffer(value),
        ($0.BuyFoodResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPotionRecipesRequest,
            $0.GetPotionRecipesResponse>(
        'GetPotionRecipes',
        getPotionRecipes_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetPotionRecipesRequest.fromBuffer(value),
        ($0.GetPotionRecipesResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DrinkPotionRequest, $0.DrinkPotionResponse>(
            'DrinkPotion',
            drinkPotion_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DrinkPotionRequest.fromBuffer(value),
            ($0.DrinkPotionResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.StartBarracksRequest, $0.StartBarracksResponse>(
            'StartBarracks',
            startBarracks_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.StartBarracksRequest.fromBuffer(value),
            ($0.StartBarracksResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ClaimBarracksRequest, $0.ClaimBarracksResponse>(
            'ClaimBarracks',
            claimBarracks_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ClaimBarracksRequest.fromBuffer(value),
            ($0.ClaimBarracksResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetRaidLogsRequest, $0.GetRaidLogsResponse>(
            'GetRaidLogs',
            getRaidLogs_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetRaidLogsRequest.fromBuffer(value),
            ($0.GetRaidLogsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetLeaderboardRequest,
            $0.GetLeaderboardResponse>(
        'GetLeaderboard',
        getLeaderboard_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetLeaderboardRequest.fromBuffer(value),
        ($0.GetLeaderboardResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SearchPlayerRequest, $0.SearchPlayerResponse>(
            'SearchPlayer',
            searchPlayer_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.SearchPlayerRequest.fromBuffer(value),
            ($0.SearchPlayerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddFriendRequest, $0.AddFriendResponse>(
        'AddFriend',
        addFriend_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddFriendRequest.fromBuffer(value),
        ($0.AddFriendResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetFriendsRequest, $0.GetFriendsResponse>(
        'GetFriends',
        getFriends_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetFriendsRequest.fromBuffer(value),
        ($0.GetFriendsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AcceptFriendRequest, $0.AcceptFriendResponse>(
            'AcceptFriend',
            acceptFriend_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AcceptFriendRequest.fromBuffer(value),
            ($0.AcceptFriendResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateClanRequest, $0.CreateClanResponse>(
        'CreateClan',
        createClan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateClanRequest.fromBuffer(value),
        ($0.CreateClanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.JoinClanRequest, $0.JoinClanResponse>(
        'JoinClan',
        joinClan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.JoinClanRequest.fromBuffer(value),
        ($0.JoinClanResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetClanInfoRequest, $0.GetClanInfoResponse>(
            'GetClanInfo',
            getClanInfo_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetClanInfoRequest.fromBuffer(value),
            ($0.GetClanInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchClanRequest, $0.SearchClanResponse>(
        'SearchClan',
        searchClan_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SearchClanRequest.fromBuffer(value),
        ($0.SearchClanResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetClanLeaderboardRequest,
            $0.GetClanLeaderboardResponse>(
        'GetClanLeaderboard',
        getClanLeaderboard_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetClanLeaderboardRequest.fromBuffer(value),
        ($0.GetClanLeaderboardResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateCoopGroupRequest,
            $0.CreateCoopGroupResponse>(
        'CreateCoopGroup',
        createCoopGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateCoopGroupRequest.fromBuffer(value),
        ($0.CreateCoopGroupResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.JoinCoopGroupRequest, $0.JoinCoopGroupResponse>(
            'JoinCoopGroup',
            joinCoopGroup_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.JoinCoopGroupRequest.fromBuffer(value),
            ($0.JoinCoopGroupResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LeaveCoopGroupRequest,
            $0.LeaveCoopGroupResponse>(
        'LeaveCoopGroup',
        leaveCoopGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.LeaveCoopGroupRequest.fromBuffer(value),
        ($0.LeaveCoopGroupResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetCoopGroupRequest, $0.GetCoopGroupResponse>(
            'GetCoopGroup',
            getCoopGroup_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetCoopGroupRequest.fromBuffer(value),
            ($0.GetCoopGroupResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetReadyRequest, $0.SetReadyResponse>(
        'SetReady',
        setReady_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SetReadyRequest.fromBuffer(value),
        ($0.SetReadyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DepositClanGoldRequest,
            $0.DepositClanGoldResponse>(
        'DepositClanGold',
        depositClanGold_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DepositClanGoldRequest.fromBuffer(value),
        ($0.DepositClanGoldResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.BuyClanBuffRequest, $0.BuyClanBuffResponse>(
            'BuyClanBuff',
            buyClanBuff_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.BuyClanBuffRequest.fromBuffer(value),
            ($0.BuyClanBuffResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPlayerProfileRequest,
            $0.GetPlayerProfileResponse>(
        'GetPlayerProfile',
        getPlayerProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetPlayerProfileRequest.fromBuffer(value),
        ($0.GetPlayerProfileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FindRaidTargetRequest,
            $0.FindRaidTargetResponse>(
        'FindRaidTarget',
        findRaidTarget_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FindRaidTargetRequest.fromBuffer(value),
        ($0.FindRaidTargetResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AttackPlayerRequest, $0.AttackPlayerResponse>(
            'AttackPlayer',
            attackPlayer_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AttackPlayerRequest.fromBuffer(value),
            ($0.AttackPlayerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAchievementsRequest,
            $0.GetAchievementsResponse>(
        'GetAchievements',
        getAchievements_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetAchievementsRequest.fromBuffer(value),
        ($0.GetAchievementsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CheatGiveAllRequest, $0.CheatGiveAllResponse>(
            'CheatGiveAll',
            cheatGiveAll_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CheatGiveAllRequest.fromBuffer(value),
            ($0.CheatGiveAllResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetCityResponse> getCity_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetCityRequest> $request) async {
    return getCity($call, await $request);
  }

  $async.Future<$0.GetCityResponse> getCity(
      $grpc.ServiceCall call, $0.GetCityRequest request);

  $async.Future<$0.UpgradeBuildingResponse> upgradeBuilding_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.UpgradeBuildingRequest> $request) async {
    return upgradeBuilding($call, await $request);
  }

  $async.Future<$0.UpgradeBuildingResponse> upgradeBuilding(
      $grpc.ServiceCall call, $0.UpgradeBuildingRequest request);

  $async.Future<$0.GetFoodRecipesResponse> getFoodRecipes_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetFoodRecipesRequest> $request) async {
    return getFoodRecipes($call, await $request);
  }

  $async.Future<$0.GetFoodRecipesResponse> getFoodRecipes(
      $grpc.ServiceCall call, $0.GetFoodRecipesRequest request);

  $async.Future<$0.BuyFoodResponse> buyFood_Pre($grpc.ServiceCall $call,
      $async.Future<$0.BuyFoodRequest> $request) async {
    return buyFood($call, await $request);
  }

  $async.Future<$0.BuyFoodResponse> buyFood(
      $grpc.ServiceCall call, $0.BuyFoodRequest request);

  $async.Future<$0.GetPotionRecipesResponse> getPotionRecipes_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetPotionRecipesRequest> $request) async {
    return getPotionRecipes($call, await $request);
  }

  $async.Future<$0.GetPotionRecipesResponse> getPotionRecipes(
      $grpc.ServiceCall call, $0.GetPotionRecipesRequest request);

  $async.Future<$0.DrinkPotionResponse> drinkPotion_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DrinkPotionRequest> $request) async {
    return drinkPotion($call, await $request);
  }

  $async.Future<$0.DrinkPotionResponse> drinkPotion(
      $grpc.ServiceCall call, $0.DrinkPotionRequest request);

  $async.Future<$0.StartBarracksResponse> startBarracks_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.StartBarracksRequest> $request) async {
    return startBarracks($call, await $request);
  }

  $async.Future<$0.StartBarracksResponse> startBarracks(
      $grpc.ServiceCall call, $0.StartBarracksRequest request);

  $async.Future<$0.ClaimBarracksResponse> claimBarracks_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ClaimBarracksRequest> $request) async {
    return claimBarracks($call, await $request);
  }

  $async.Future<$0.ClaimBarracksResponse> claimBarracks(
      $grpc.ServiceCall call, $0.ClaimBarracksRequest request);

  $async.Future<$0.GetRaidLogsResponse> getRaidLogs_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetRaidLogsRequest> $request) async {
    return getRaidLogs($call, await $request);
  }

  $async.Future<$0.GetRaidLogsResponse> getRaidLogs(
      $grpc.ServiceCall call, $0.GetRaidLogsRequest request);

  $async.Future<$0.GetLeaderboardResponse> getLeaderboard_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetLeaderboardRequest> $request) async {
    return getLeaderboard($call, await $request);
  }

  $async.Future<$0.GetLeaderboardResponse> getLeaderboard(
      $grpc.ServiceCall call, $0.GetLeaderboardRequest request);

  $async.Future<$0.SearchPlayerResponse> searchPlayer_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SearchPlayerRequest> $request) async {
    return searchPlayer($call, await $request);
  }

  $async.Future<$0.SearchPlayerResponse> searchPlayer(
      $grpc.ServiceCall call, $0.SearchPlayerRequest request);

  $async.Future<$0.AddFriendResponse> addFriend_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AddFriendRequest> $request) async {
    return addFriend($call, await $request);
  }

  $async.Future<$0.AddFriendResponse> addFriend(
      $grpc.ServiceCall call, $0.AddFriendRequest request);

  $async.Future<$0.GetFriendsResponse> getFriends_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetFriendsRequest> $request) async {
    return getFriends($call, await $request);
  }

  $async.Future<$0.GetFriendsResponse> getFriends(
      $grpc.ServiceCall call, $0.GetFriendsRequest request);

  $async.Future<$0.AcceptFriendResponse> acceptFriend_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AcceptFriendRequest> $request) async {
    return acceptFriend($call, await $request);
  }

  $async.Future<$0.AcceptFriendResponse> acceptFriend(
      $grpc.ServiceCall call, $0.AcceptFriendRequest request);

  $async.Future<$0.CreateClanResponse> createClan_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateClanRequest> $request) async {
    return createClan($call, await $request);
  }

  $async.Future<$0.CreateClanResponse> createClan(
      $grpc.ServiceCall call, $0.CreateClanRequest request);

  $async.Future<$0.JoinClanResponse> joinClan_Pre($grpc.ServiceCall $call,
      $async.Future<$0.JoinClanRequest> $request) async {
    return joinClan($call, await $request);
  }

  $async.Future<$0.JoinClanResponse> joinClan(
      $grpc.ServiceCall call, $0.JoinClanRequest request);

  $async.Future<$0.GetClanInfoResponse> getClanInfo_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetClanInfoRequest> $request) async {
    return getClanInfo($call, await $request);
  }

  $async.Future<$0.GetClanInfoResponse> getClanInfo(
      $grpc.ServiceCall call, $0.GetClanInfoRequest request);

  $async.Future<$0.SearchClanResponse> searchClan_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SearchClanRequest> $request) async {
    return searchClan($call, await $request);
  }

  $async.Future<$0.SearchClanResponse> searchClan(
      $grpc.ServiceCall call, $0.SearchClanRequest request);

  $async.Future<$0.GetClanLeaderboardResponse> getClanLeaderboard_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetClanLeaderboardRequest> $request) async {
    return getClanLeaderboard($call, await $request);
  }

  $async.Future<$0.GetClanLeaderboardResponse> getClanLeaderboard(
      $grpc.ServiceCall call, $0.GetClanLeaderboardRequest request);

  $async.Future<$0.CreateCoopGroupResponse> createCoopGroup_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateCoopGroupRequest> $request) async {
    return createCoopGroup($call, await $request);
  }

  $async.Future<$0.CreateCoopGroupResponse> createCoopGroup(
      $grpc.ServiceCall call, $0.CreateCoopGroupRequest request);

  $async.Future<$0.JoinCoopGroupResponse> joinCoopGroup_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.JoinCoopGroupRequest> $request) async {
    return joinCoopGroup($call, await $request);
  }

  $async.Future<$0.JoinCoopGroupResponse> joinCoopGroup(
      $grpc.ServiceCall call, $0.JoinCoopGroupRequest request);

  $async.Future<$0.LeaveCoopGroupResponse> leaveCoopGroup_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.LeaveCoopGroupRequest> $request) async {
    return leaveCoopGroup($call, await $request);
  }

  $async.Future<$0.LeaveCoopGroupResponse> leaveCoopGroup(
      $grpc.ServiceCall call, $0.LeaveCoopGroupRequest request);

  $async.Future<$0.GetCoopGroupResponse> getCoopGroup_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetCoopGroupRequest> $request) async {
    return getCoopGroup($call, await $request);
  }

  $async.Future<$0.GetCoopGroupResponse> getCoopGroup(
      $grpc.ServiceCall call, $0.GetCoopGroupRequest request);

  $async.Future<$0.SetReadyResponse> setReady_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SetReadyRequest> $request) async {
    return setReady($call, await $request);
  }

  $async.Future<$0.SetReadyResponse> setReady(
      $grpc.ServiceCall call, $0.SetReadyRequest request);

  $async.Future<$0.DepositClanGoldResponse> depositClanGold_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DepositClanGoldRequest> $request) async {
    return depositClanGold($call, await $request);
  }

  $async.Future<$0.DepositClanGoldResponse> depositClanGold(
      $grpc.ServiceCall call, $0.DepositClanGoldRequest request);

  $async.Future<$0.BuyClanBuffResponse> buyClanBuff_Pre($grpc.ServiceCall $call,
      $async.Future<$0.BuyClanBuffRequest> $request) async {
    return buyClanBuff($call, await $request);
  }

  $async.Future<$0.BuyClanBuffResponse> buyClanBuff(
      $grpc.ServiceCall call, $0.BuyClanBuffRequest request);

  $async.Future<$0.GetPlayerProfileResponse> getPlayerProfile_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetPlayerProfileRequest> $request) async {
    return getPlayerProfile($call, await $request);
  }

  $async.Future<$0.GetPlayerProfileResponse> getPlayerProfile(
      $grpc.ServiceCall call, $0.GetPlayerProfileRequest request);

  $async.Future<$0.FindRaidTargetResponse> findRaidTarget_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FindRaidTargetRequest> $request) async {
    return findRaidTarget($call, await $request);
  }

  $async.Future<$0.FindRaidTargetResponse> findRaidTarget(
      $grpc.ServiceCall call, $0.FindRaidTargetRequest request);

  $async.Future<$0.AttackPlayerResponse> attackPlayer_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AttackPlayerRequest> $request) async {
    return attackPlayer($call, await $request);
  }

  $async.Future<$0.AttackPlayerResponse> attackPlayer(
      $grpc.ServiceCall call, $0.AttackPlayerRequest request);

  $async.Future<$0.GetAchievementsResponse> getAchievements_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetAchievementsRequest> $request) async {
    return getAchievements($call, await $request);
  }

  $async.Future<$0.GetAchievementsResponse> getAchievements(
      $grpc.ServiceCall call, $0.GetAchievementsRequest request);

  $async.Future<$0.CheatGiveAllResponse> cheatGiveAll_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CheatGiveAllRequest> $request) async {
    return cheatGiveAll($call, await $request);
  }

  $async.Future<$0.CheatGiveAllResponse> cheatGiveAll(
      $grpc.ServiceCall call, $0.CheatGiveAllRequest request);
}
