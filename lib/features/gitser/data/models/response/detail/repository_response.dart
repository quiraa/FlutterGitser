import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'repository_response.g.dart';

@JsonSerializable()
class RepositoryResponse {
  final bool? allow_forking;
  final String? archive_url;
  final bool? archived;
  final String? assignees_url;
  final String? blobs_url;
  final String? branches_url;
  final String? clone_url;
  final String? collaborators_url;
  final String? comments_url;
  final String? commits_url;
  final String? compare_url;
  final String? contents_url;
  final String? contributors_url;
  final String? created_at;
  final String? default_branch;
  final String? deployments_url;
  final dynamic description;
  final bool? disabled;
  final String? downloads_url;
  final String? events_url;
  final bool? fork;
  final int? forks;
  final int? forks_count;
  final String? forks_url;
  final String? full_name;
  final String? git_commits_url;
  final String? git_refs_url;
  final String? git_tags_url;
  final String? git_url;
  final bool? has_discussions;
  final bool? has_downloads;
  final bool? has_issues;
  final bool? has_pages;
  final bool? has_projects;
  final bool? homepage;
  final dynamic has_wiki;
  final String? hooks_url;
  final String? html_url;
  final int? id;
  final bool? is_template;
  final String? issue_comment_url;
  final String? issue_events_url;
  final String? issues_url;
  final String? keys_url;
  final String? labels_url;
  final String? language;
  final String? languages_url;
  final dynamic license;
  final String? merges_url;
  final String? milestones_url;
  final dynamic mirror_url;
  final String? name;
  final String? node_id;
  final String? notifications_url;
  final int? open_issues;
  final int? open_issues_count;
  final UserResponseItem? owner;
  final bool? private;
  final String? pulls_url;
  final String? pushed_at;
  final String? releases_url;
  final int? size;
  final String? ssh_url;
  final int? stargazers_count;
  final String? stargazers_url;
  final String? statuses_url;
  final String? subscribers_url;
  final String? subscription_url;
  final String? svn_url;
  final String? tags_url;
  final String? teams_url;
  final List<dynamic>? topics;
  final String? trees_url;
  final String? updated_at;
  final String? url;
  final String? visibility;
  final int? watchers;
  final int? watchers_count;
  final bool? web_commit_signoff_required;

  RepositoryResponse({
    this.allow_forking,
    this.archive_url,
    this.archived,
    this.assignees_url,
    this.blobs_url,
    this.branches_url,
    this.clone_url,
    this.collaborators_url,
    this.comments_url,
    this.commits_url,
    this.compare_url,
    this.contents_url,
    this.contributors_url,
    this.created_at,
    this.default_branch,
    this.deployments_url,
    this.description,
    this.disabled,
    this.downloads_url,
    this.events_url,
    this.fork,
    this.forks,
    this.forks_count,
    this.forks_url,
    this.full_name,
    this.git_commits_url,
    this.git_refs_url,
    this.git_tags_url,
    this.git_url,
    this.has_discussions,
    this.has_downloads,
    this.has_issues,
    this.has_pages,
    this.has_projects,
    this.has_wiki,
    this.homepage,
    this.hooks_url,
    this.html_url,
    this.id,
    this.is_template,
    this.issue_comment_url,
    this.issue_events_url,
    this.issues_url,
    this.keys_url,
    this.labels_url,
    this.language,
    this.languages_url,
    this.license,
    this.merges_url,
    this.milestones_url,
    this.mirror_url,
    this.name,
    this.node_id,
    this.notifications_url,
    this.open_issues,
    this.open_issues_count,
    this.owner,
    this.private,
    this.pulls_url,
    this.pushed_at,
    this.releases_url,
    this.size,
    this.ssh_url,
    this.stargazers_count,
    this.stargazers_url,
    this.statuses_url,
    this.subscribers_url,
    this.subscription_url,
    this.svn_url,
    this.tags_url,
    this.teams_url,
    this.topics,
    this.trees_url,
    this.updated_at,
    this.url,
    this.visibility,
    this.watchers,
    this.watchers_count,
    this.web_commit_signoff_required,
  });

  factory RepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$RepositoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryResponseToJson(this);
}
