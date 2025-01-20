class ApiException implements Exception {
  final String message;
  final Map<String, dynamic> responseData;
  ApiException(this.message, {this.responseData = const {}});

  @override
  String toString() => message;
}