import 'package:json_annotation/json_annotation.dart';
part 'detail_response.g.dart';

@JsonSerializable()
class DetailResponse {
  final String? avatar_url;
  final dynamic bio;
  final String? blog;
  final String? company;
  final dynamic email;
  final String? events_url;
  final int? followers;
  final int? following;
  final String? followers_url;
  final String? following_url;
  final String? gists_url;
  final String? gravatar_id;
  final dynamic hireable;
  final String? html_url;
  final int? id;
  final String? location;
  final String? login;
  final String? name;
  final String? node_id;
  final String? organizations_url;
  final int? public_gists;
  final int? public_repos;
  final String? received_events_url;
  final String? repos_url;
  final bool? site_admin;
  final String? starred_url;
  final String? subscriptions_url;
  final dynamic twitter_username;
  final String? type;
  final String? updated_at;
  final String? created_at;
  final String? url;

  DetailResponse({
    this.avatar_url,
    this.bio,
    this.blog,
    this.company,
    this.email,
    this.events_url,
    this.followers,
    this.followers_url,
    this.following,
    this.following_url,
    this.gists_url,
    this.gravatar_id,
    this.hireable,
    this.html_url,
    this.id,
    this.location,
    this.login,
    this.name,
    this.node_id,
    this.organizations_url,
    this.public_gists,
    this.public_repos,
    this.received_events_url,
    this.repos_url,
    this.site_admin,
    this.starred_url,
    this.subscriptions_url,
    this.twitter_username,
    this.type,
    this.updated_at,
    this.created_at,
    this.url,
  });

  factory DetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailResponseToJson(this);
}
