import 'package:json_annotation/json_annotation.dart';
part 'detail_response.g.dart';

@JsonSerializable()
class DetailResponse {
  final String? avatarUrl;
  final dynamic bio;
  final String? blog;
  final String? company;
  final dynamic email;
  final String? eventsUrl;
  final int? followers;
  final int? following;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? gravatarId;
  final dynamic hireable;
  final String? htmlUrl;
  final int? id;
  final String? location;
  final String? login;
  final String? name;
  final String? nodeId;
  final String? organizationsUrl;
  final int? publicGists;
  final int? publicRepos;
  final String? receivedEventsUrl;
  final String? reposUrl;
  final bool? siteAdmin;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final dynamic twitterUsername;
  final String? type;
  final String? updatedAt;
  final String? createdAt;
  final String? url;

  DetailResponse({
    this.avatarUrl,
    this.bio,
    this.blog,
    this.company,
    this.email,
    this.eventsUrl,
    this.followers,
    this.followersUrl,
    this.following,
    this.followingUrl,
    this.gistsUrl,
    this.gravatarId,
    this.hireable,
    this.htmlUrl,
    this.id,
    this.location,
    this.login,
    this.name,
    this.nodeId,
    this.organizationsUrl,
    this.publicGists,
    this.publicRepos,
    this.receivedEventsUrl,
    this.reposUrl,
    this.siteAdmin,
    this.starredUrl,
    this.subscriptionsUrl,
    this.twitterUsername,
    this.type,
    this.updatedAt,
    this.createdAt,
    this.url,
  });

  factory DetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailResponseToJson(this);
}
