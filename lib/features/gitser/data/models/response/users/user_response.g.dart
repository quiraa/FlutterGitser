// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseItem _$UserResponseItemFromJson(Map<String, dynamic> json) =>
    UserResponseItem(
      avatarUrl: json['avatar_url'] as String?,
      eventsUrl: json['events_url'] as String?,
      followersUrl: json['followers_url'] as String?,
      followingUrl: json['following_url'] as String?,
      gistsUrl: json['gists_url'] as String?,
      gravatarId: json['gravatar_id'] as String?,
      htmlUrl: json['html_url'] as String?,
      id: json['id'] as int?,
      login: json['login'] as String?,
      nodeId: json['nodeId'] as String?,
      organizationsUrl: json['organizations_url'] as String?,
      receivedEventsUrl: json['received_events_url'] as String?,
      reposUrl: json['repos_url'] as String?,
      siteAdmin: json['site_admin'] as bool?,
      starredUrl: json['starred_url'] as String?,
      subscriptionsUrl: json['subscriptions_url'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$UserResponseItemToJson(UserResponseItem instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'eventsUrl': instance.eventsUrl,
      'followersUrl': instance.followersUrl,
      'followingUrl': instance.followingUrl,
      'gistsUrl': instance.gistsUrl,
      'gravatarId': instance.gravatarId,
      'htmlUrl': instance.htmlUrl,
      'id': instance.id,
      'login': instance.login,
      'nodeId': instance.nodeId,
      'organizationsUrl': instance.organizationsUrl,
      'receivedEventsUrl': instance.receivedEventsUrl,
      'reposUrl': instance.reposUrl,
      'siteAdmin': instance.siteAdmin,
      'starredUrl': instance.starredUrl,
      'subscriptionsUrl': instance.subscriptionsUrl,
      'type': instance.type,
      'url': instance.url,
    };
