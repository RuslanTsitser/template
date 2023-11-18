part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
  const factory AuthEvent.started() = AuthEventStarted;
}

class AuthEventStarted extends AuthEvent {
  const AuthEventStarted();
}

class AuthEventSignedInWithEmailAndPassword extends AuthEvent {
  const AuthEventSignedInWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
