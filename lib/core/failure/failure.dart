class Failure {
  final String error;
  final String? statusCode;

  Failure({
    required this.error,
    this.statusCode,
  });

  @override
  String toString() => 'Failure(error: $error, statusCode: $statusCode)';
}
