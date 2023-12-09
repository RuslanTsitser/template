part of 'auth_bloc.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthSignedIn extends AuthState {
  const AuthSignedIn();
}

final class AuthSignedOut extends AuthState {
  const AuthSignedOut();
}
