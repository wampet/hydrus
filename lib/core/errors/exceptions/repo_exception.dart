import 'package:hydrus/core/errors/failures.dart';

class RepoException implements Exception {
  final String message;
  final Failure failure;

  RepoException({required this.message, required this.failure});

  @override
  String toString() {
    return super.toString() +
        message.toString() +
        " failure: " +
        failure.toString();
  }
}
