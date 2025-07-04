import 'package:clean_arch_gb/infrastructure/model/github_owner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_api_response.freezed.dart';
part 'github_api_response.g.dart';

@freezed
sealed class GithubApiResponse with _$GithubApiResponse {
  factory GithubApiResponse({
    required int id,
    required String nodeId,
    required String name,
    required String fullName,
    required bool private,
    required GithubOwner owner,
    required String htmlUrl,
    required String? description,
    required bool fork,
    required String apiUrl,
    required String forksUrl,
    required String keysUrl,
    required String collaboratorsUrl,
    required String teamsUrl,
    required String hooksUrl,
    required String issueEventsUrl,
    required String eventsUrl,
    required String assigneesUrl,
    required String branchesUrl,
    required String tagsUrl,
    required String blobsUrl,
    required String gitTagsUrl,
    required String gitRefsUrl,
    required String treesUrl,
    required String statusesUrl,
    required String languagesUrl,
    required String stargazersUrl,
    required String contributorsUrl,
    required String subscribersUrl,
    required String subscriptionUrl,
    required String commitsUrl,
    required String gitCommitsUrl,
    required String commentsUrl,
    required String issueCommentUrl,
    required String contentsUrl,
    required String compareUrl,
    required String mergesUrl,
    required String archiveUrl,
    required String downloadsUrl,
    required String issuesUrl,
    required String pullsUrl,
    required String milestonesUrl,
    required String notificationsUrl,
    required String labelsUrl,
    required String releasesUrl,
    required String deploymentsUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime pushedAt,
    required String gitUrl,
    required String sshUrl,
    required String cloneUrl,
    required String svnUrl,
    required String? homepage,
    required int size,
    required int stargazersCount,
    required int watchersCount,
    required String? language,
    required bool hasIssues,
    required bool hasProjects,
    required bool hasDownloads,
    required bool hasWiki,
    required bool hasPages,
    required bool hasDiscussions,
    required int forksCount,
    String? mirrorUrl,
    required bool archived,
    required bool disabled,
    required int openIssuesCount,
    required String? license,
    required int forks,
    required int openIssues,
    required int watchers,
    required String defaultBranch,
    String? tempCloneToken,
    required int networkCount,
    required int subscribersCount,
  }) = _GithubApiResponse;

  factory GithubApiResponse.fromJson(Map<String, dynamic> json) =>
      _$GithubApiResponseFromJson(json);
}
