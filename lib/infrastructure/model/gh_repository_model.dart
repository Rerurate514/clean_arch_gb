import 'package:clean_arch_gb/infrastructure/model/github_owner.dart';
import 'package:clean_arch_gb/infrastructure/model/github_repository_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gh_repository_model.freezed.dart';
part 'gh_repository_model.g.dart';

@freezed
sealed class GhRepositoryModel with _$GhRepositoryModel {

  factory GhRepositoryModel({
    required GithubRepositoryDetails githubRepositoryDetails,
    required GithubOwner githubOwner
  }) = _GhRepositoryModel;

  factory GhRepositoryModel.fromJson(Map<String, dynamic> json) => _$GhRepositoryModelFromJson(json);
}
