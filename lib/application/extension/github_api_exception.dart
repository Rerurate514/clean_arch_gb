class GithubApiException implements Exception {
  final int statusCode;
  final String message;

  GithubApiException({
    required this.statusCode,
    required this.message
  });

  @override
  String toString() {
    return "GithubApiException: $statusCode - $message";
  }
}
