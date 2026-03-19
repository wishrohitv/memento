class ErrorResult {
  final String message;

  ErrorResult([this.message = "Something occurred wrong"]);

  @override
  String toString() => "ErrorResult(message=$message)";
}
