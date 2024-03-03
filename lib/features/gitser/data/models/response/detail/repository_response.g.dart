// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryResponse _$RepositoryResponseFromJson(Map<String, dynamic> json) =>
    RepositoryResponse(
      allow_forking: json['allow_forking'] as bool?,
      archive_url: json['archive_url'] as String?,
      archived: json['archived'] as bool?,
      assignees_url: json['assignees_url'] as String?,
      blobs_url: json['blobs_url'] as String?,
      branches_url: json['branches_url'] as String?,
      clone_url: json['clone_url'] as String?,
      collaborators_url: json['collaborators_url'] as String?,
      comments_url: json['comments_url'] as String?,
      commits_url: json['commits_url'] as String?,
      compare_url: json['compare_url'] as String?,
      contents_url: json['contents_url'] as String?,
      contributors_url: json['contributors_url'] as String?,
      created_at: json['created_at'] as String?,
      default_branch: json['default_branch'] as String?,
      deployments_url: json['deployments_url'] as String?,
      description: json['description'],
      disabled: json['disabled'] as bool?,
      downloads_url: json['downloads_url'] as String?,
      events_url: json['events_url'] as String?,
      fork: json['fork'] as bool?,
      forks: json['forks'] as int?,
      forks_count: json['forks_count'] as int?,
      forks_url: json['forks_url'] as String?,
      full_name: json['full_name'] as String?,
      git_commits_url: json['git_commits_url'] as String?,
      git_refs_url: json['git_refs_url'] as String?,
      git_tags_url: json['git_tags_url'] as String?,
      git_url: json['git_url'] as String?,
      has_discussions: json['has_discussions'] as bool?,
      has_downloads: json['has_downloads'] as bool?,
      has_issues: json['has_issues'] as bool?,
      has_pages: json['has_pages'] as bool?,
      has_projects: json['has_projects'] as bool?,
      has_wiki: json['has_wiki'],
      homepage: json['homepage'] as bool?,
      hooks_url: json['hooks_url'] as String?,
      html_url: json['html_url'] as String?,
      id: json['id'] as int?,
      is_template: json['is_template'] as bool?,
      issue_comment_url: json['issue_comment_url'] as String?,
      issue_events_url: json['issue_events_url'] as String?,
      issues_url: json['issues_url'] as String?,
      keys_url: json['keys_url'] as String?,
      labels_url: json['labels_url'] as String?,
      language: json['language'] as String?,
      languages_url: json['languages_url'] as String?,
      license: json['license'],
      merges_url: json['merges_url'] as String?,
      milestones_url: json['milestones_url'] as String?,
      mirror_url: json['mirror_url'],
      name: json['name'] as String?,
      node_id: json['node_id'] as String?,
      notifications_url: json['notifications_url'] as String?,
      open_issues: json['open_issues'] as int?,
      open_issues_count: json['open_issues_count'] as int?,
      owner: json['owner'] == null
          ? null
          : UserResponseItem.fromJson(json['owner'] as Map<String, dynamic>),
      private: json['private'] as bool?,
      pulls_url: json['pulls_url'] as String?,
      pushed_at: json['pushed_at'] as String?,
      releases_url: json['releases_url'] as String?,
      size: json['size'] as int?,
      ssh_url: json['ssh_url'] as String?,
      stargazers_count: json['stargazers_count'] as int?,
      stargazers_url: json['stargazers_url'] as String?,
      statuses_url: json['statuses_url'] as String?,
      subscribers_url: json['subscribers_url'] as String?,
      subscription_url: json['subscription_url'] as String?,
      svn_url: json['svn_url'] as String?,
      tags_url: json['tags_url'] as String?,
      teams_url: json['teams_url'] as String?,
      topics: json['topics'] as List<dynamic>?,
      trees_url: json['trees_url'] as String?,
      updated_at: json['updated_at'] as String?,
      url: json['url'] as String?,
      visibility: json['visibility'] as String?,
      watchers: json['watchers'] as int?,
      watchers_count: json['watchers_count'] as int?,
      web_commit_signoff_required: json['web_commit_signoff_required'] as bool?,
    );

Map<String, dynamic> _$RepositoryResponseToJson(RepositoryResponse instance) =>
    <String, dynamic>{
      'allow_forking': instance.allow_forking,
      'archive_url': instance.archive_url,
      'archived': instance.archived,
      'assignees_url': instance.assignees_url,
      'blobs_url': instance.blobs_url,
      'branches_url': instance.branches_url,
      'clone_url': instance.clone_url,
      'collaborators_url': instance.collaborators_url,
      'comments_url': instance.comments_url,
      'commits_url': instance.commits_url,
      'compare_url': instance.compare_url,
      'contents_url': instance.contents_url,
      'contributors_url': instance.contributors_url,
      'created_at': instance.created_at,
      'default_branch': instance.default_branch,
      'deployments_url': instance.deployments_url,
      'description': instance.description,
      'disabled': instance.disabled,
      'downloads_url': instance.downloads_url,
      'events_url': instance.events_url,
      'fork': instance.fork,
      'forks': instance.forks,
      'forks_count': instance.forks_count,
      'forks_url': instance.forks_url,
      'full_name': instance.full_name,
      'git_commits_url': instance.git_commits_url,
      'git_refs_url': instance.git_refs_url,
      'git_tags_url': instance.git_tags_url,
      'git_url': instance.git_url,
      'has_discussions': instance.has_discussions,
      'has_downloads': instance.has_downloads,
      'has_issues': instance.has_issues,
      'has_pages': instance.has_pages,
      'has_projects': instance.has_projects,
      'homepage': instance.homepage,
      'has_wiki': instance.has_wiki,
      'hooks_url': instance.hooks_url,
      'html_url': instance.html_url,
      'id': instance.id,
      'is_template': instance.is_template,
      'issue_comment_url': instance.issue_comment_url,
      'issue_events_url': instance.issue_events_url,
      'issues_url': instance.issues_url,
      'keys_url': instance.keys_url,
      'labels_url': instance.labels_url,
      'language': instance.language,
      'languages_url': instance.languages_url,
      'license': instance.license,
      'merges_url': instance.merges_url,
      'milestones_url': instance.milestones_url,
      'mirror_url': instance.mirror_url,
      'name': instance.name,
      'node_id': instance.node_id,
      'notifications_url': instance.notifications_url,
      'open_issues': instance.open_issues,
      'open_issues_count': instance.open_issues_count,
      'owner': instance.owner,
      'private': instance.private,
      'pulls_url': instance.pulls_url,
      'pushed_at': instance.pushed_at,
      'releases_url': instance.releases_url,
      'size': instance.size,
      'ssh_url': instance.ssh_url,
      'stargazers_count': instance.stargazers_count,
      'stargazers_url': instance.stargazers_url,
      'statuses_url': instance.statuses_url,
      'subscribers_url': instance.subscribers_url,
      'subscription_url': instance.subscription_url,
      'svn_url': instance.svn_url,
      'tags_url': instance.tags_url,
      'teams_url': instance.teams_url,
      'topics': instance.topics,
      'trees_url': instance.trees_url,
      'updated_at': instance.updated_at,
      'url': instance.url,
      'visibility': instance.visibility,
      'watchers': instance.watchers,
      'watchers_count': instance.watchers_count,
      'web_commit_signoff_required': instance.web_commit_signoff_required,
    };
