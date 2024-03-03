import 'package:json_annotation/json_annotation.dart';
part 'search_result.g.dart';

@JsonSerializable()
class SearchResult {
  final String? login;
  final int? id;
  final String? node_id;
  final String? avatar_url;
  final String? gravatar_id;
  final String? url;
  final String? html_url;
  final String? followers_url;
  final String? following_url;
  final String? events_url;
  final String? gists_url;
  final String? starred_url;
  final String? subscriptions_url;
  final String? organizations_url;
  final String? repos_url;
  final String? received_events_url;
  final String? type;
  final bool? site_admin;
  final double? score;

  SearchResult({
    this.login,
    this.id,
    this.node_id,
    this.avatar_url,
    this.gravatar_id,
    this.url,
    this.html_url,
    this.followers_url,
    this.following_url,
    this.events_url,
    this.gists_url,
    this.starred_url,
    this.subscriptions_url,
    this.organizations_url,
    this.repos_url,
    this.received_events_url,
    this.type,
    this.site_admin,
    this.score,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
