part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthStateAuthenticated extends AuthState {}

final class AuthStateUnAuthenticated extends AuthState {}
