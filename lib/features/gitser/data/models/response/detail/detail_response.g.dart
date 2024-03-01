// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailResponse _$DetailResponseFromJson(Map<String, dynamic> json) =>
    DetailResponse(
      avatarUrl: json['avatar_url'] as String?,
      bio: json['bio'],
      blog: json['blog'] as String?,
      company: json['company'] as String?,
      email: json['email'],
      eventsUrl: json['events_url'] as String?,
      followers: json['followers'] as int?,
      followersUrl: json['followers_url'] as String?,
      following: json['following'] as int?,
      followingUrl: json['following_url'] as String?,
      gistsUrl: json['gists_url'] as String?,
      gravatarId: json['gravatar_id'] as String?,
      hireable: json['hireable'],
      htmlUrl: json['html_url'] as String?,
      id: json['id'] as int?,
      location: json['location'] as String?,
      login: json['login'] as String?,
      name: json['name'] as String?,
      nodeId: json['node_id'] as String?,
      organizationsUrl: json['organizations_url'] as String?,
      publicGists: json['public_gists'] as int?,
      publicRepos: json['public_repos'] as int?,
      receivedEventsUrl: json['received_events_url'] as String?,
      reposUrl: json['reposUrl'] as String?,
      siteAdmin: json['site_admin'] as bool?,
      starredUrl: json['starred_url'] as String?,
      subscriptionsUrl: json['subscriptions_url'] as String?,
      twitterUsername: json['twitter_username'],
      type: json['type'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$DetailResponseToJson(DetailResponse instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'blog': instance.blog,
      'company': instance.company,
      'email': instance.email,
      'eventsUrl': instance.eventsUrl,
      'followers': instance.followers,
      'following': instance.following,
      'followersUrl': instance.followersUrl,
      'followingUrl': instance.followingUrl,
      'gistsUrl': instance.gistsUrl,
      'gravatarId': instance.gravatarId,
      'hireable': instance.hireable,
      'htmlUrl': instance.htmlUrl,
      'id': instance.id,
      'location': instance.location,
      'login': instance.login,
      'name': instance.name,
      'nodeId': instance.nodeId,
      'organizationsUrl': instance.organizationsUrl,
      'publicGists': instance.publicGists,
      'publicRepos': instance.publicRepos,
      'receivedEventsUrl': instance.receivedEventsUrl,
      'reposUrl': instance.reposUrl,
      'siteAdmin': instance.siteAdmin,
      'starredUrl': instance.starredUrl,
      'subscriptionsUrl': instance.subscriptionsUrl,
      'twitterUsername': instance.twitterUsername,
      'type': instance.type,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.updatedAt,
      'url': instance.url,
    };
