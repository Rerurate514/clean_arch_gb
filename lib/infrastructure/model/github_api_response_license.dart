import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_api_response_license.freezed.dart';
part 'github_api_response_license.g.dart';

@freezed
sealed class License with _$License {
  const factory License({
    required String key,
    required String name,
    @JsonKey(name: 'spdx_id') required String spdxId,
    required String? url,
    @JsonKey(name: 'node_id') required String nodeId,
  }) = _License;

  factory License.fromJson(Map<String, dynamic> json) => _$LicenseFromJson(json);
}
