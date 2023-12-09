part of 'auth_bloc.dart';

sealed class AuthEvent {
  const factory AuthEvent.signIn() = _SignIn;
  const AuthEvent();
}

class _SignIn extends AuthEvent {
  const _SignIn();
}
