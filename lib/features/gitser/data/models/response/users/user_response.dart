import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponseItem {
  final String? avatar_url;
  final String? events_url;
  final String? followers_url;
  final String? following_url;
  final String? gists_url;
  final String? gravatar_id;
  final String? html_url;
  final int? id;
  final String? login;
  final String? node_id;
  final String? organizations_url;
  final String? received_events_url;
  final String? repos_url;
  final bool? site_admin;
  final String? starred_url;
  final String? subscriptions_url;
  final String? type;
  final String? url;

  UserResponseItem({
    this.avatar_url,
    this.events_url,
    this.followers_url,
    this.following_url,
    this.gists_url,
    this.gravatar_id,
    this.html_url,
    this.id,
    this.login,
    this.node_id,
    this.organizations_url,
    this.received_events_url,
    this.repos_url,
    this.site_admin,
    this.starred_url,
    this.subscriptions_url,
    this.type,
    this.url,
  });

  factory UserResponseItem.fromJson(Map<String, dynamic> json) =>
      _$UserResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseItemToJson(this);
}
