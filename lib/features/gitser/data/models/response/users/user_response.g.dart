// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseItem _$UserResponseItemFromJson(Map<String, dynamic> json) =>
    UserResponseItem(
      avatar_url: json['avatar_url'] as String?,
      events_url: json['events_url'] as String?,
      followers_url: json['followers_url'] as String?,
      following_url: json['following_url'] as String?,
      gists_url: json['gists_url'] as String?,
      gravatar_id: json['gravatar_id'] as String?,
      html_url: json['html_url'] as String?,
      id: json['id'] as int?,
      login: json['login'] as String?,
      node_id: json['node_id'] as String?,
      organizations_url: json['organizations_url'] as String?,
      received_events_url: json['received_events_url'] as String?,
      repos_url: json['repos_url'] as String?,
      site_admin: json['site_admin'] as bool?,
      starred_url: json['starred_url'] as String?,
      subscriptions_url: json['subscriptions_url'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$UserResponseItemToJson(UserResponseItem instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatar_url,
      'events_url': instance.events_url,
      'followers_url': instance.followers_url,
      'following_url': instance.following_url,
      'gists_url': instance.gists_url,
      'gravatar_id': instance.gravatar_id,
      'html_url': instance.html_url,
      'id': instance.id,
      'login': instance.login,
      'node_id': instance.node_id,
      'organizations_url': instance.organizations_url,
      'received_events_url': instance.received_events_url,
      'repos_url': instance.repos_url,
      'site_admin': instance.site_admin,
      'starred_url': instance.starred_url,
      'subscriptions_url': instance.subscriptions_url,
      'type': instance.type,
      'url': instance.url,
    };
