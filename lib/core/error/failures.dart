import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({
    this.message,
  });

  // const Failure([List properties = const <dynamic>[]]);

  @override
  List<Object?> get props => [message];
}

// General failures
class ServerFailure implements Failure {
  @override
  final String? message;

  const ServerFailure({
    this.message,
  });

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}

// General failures
class NoInternetConnectionFailure implements Failure {
  @override
  String? get message => 'No internet connection';

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}
