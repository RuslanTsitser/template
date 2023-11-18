import 'package:bloc/bloc.dart';
import 'package:pdf_editor/features/auth/domain/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) => switch (event) {
          AuthEventStarted() => _onStarted(event, emit),
          AuthEventSignedInWithEmailAndPassword() => _onSignedInWithEmailAndPassword(event, emit),
        });
  }

  Future<void> _onSignedInWithEmailAndPassword(
    AuthEventSignedInWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _authRepository.signInWithEmailAndPassword(event.email, event.password);
    if (result) {
      emit(AuthStateAuthenticated());
    } else {
      emit(AuthStateUnAuthenticated());
    }
  }

  Future<void> _onStarted(
    AuthEventStarted event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _authRepository.checkAuth();
    if (result) {
      emit(AuthStateAuthenticated());
    } else {
      emit(AuthStateUnAuthenticated());
    }
  }
}
