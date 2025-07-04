import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_owner.freezed.dart';
part 'github_owner.g.dart';

@freezed
sealed class GithubOwner with _$GithubOwner {
  factory GithubOwner({
    required String login,
    required int id,
    required String nodeId,
    required String avatarUrl,
    required String gravatarId,
    required String url,
    required String htmlUrl,
    required String followersUrl,
    required String followingUrl,
    required String gistsUrl,
    required String starredUrl,
    required String subscriptionsUrl,
    required String organizationsUrl,
    required String reposUrl,
    required String eventsUrl,
    required String receivedEventsUrl,
    required String type,
    required bool siteAdmin,
  }) = _GithubOwner;

  factory GithubOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubOwnerFromJson(json);
}
