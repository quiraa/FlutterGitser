import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponseItem {
  final String? avatarUrl;
  final String? eventsUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? gravatarId;
  final String? htmlUrl;
  final int? id;
  final String? login;
  final String? nodeId;
  final String? organizationsUrl;
  final String? receivedEventsUrl;
  final String? reposUrl;
  final bool? siteAdmin;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? type;
  final String? url;

  UserResponseItem({
    this.avatarUrl,
    this.eventsUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.gravatarId,
    this.htmlUrl,
    this.id,
    this.login,
    this.nodeId,
    this.organizationsUrl,
    this.receivedEventsUrl,
    this.reposUrl,
    this.siteAdmin,
    this.starredUrl,
    this.subscriptionsUrl,
    this.type,
    this.url,
  });

  factory UserResponseItem.fromJson(Map<String, dynamic> json) =>
      _$UserResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseItemToJson(this);
}
