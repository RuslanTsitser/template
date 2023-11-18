import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_editor/core/services/local_storage_service/local_storage_service.dart';
import 'package:pdf_editor/features/auth/data/auth_repository_local_storage_impl.dart';
import 'package:pdf_editor/features/auth/domain/auth_repository.dart';
import 'package:pdf_editor/features/auth/logic/auth/auth_bloc.dart';
import 'package:pdf_editor/features/auth/presentation/auth_screen.dart';
import 'package:pdf_editor/features/pdf/presentation/pdf_screen.dart';
import 'package:pdf_editor/features/splash/presentation/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalStorageService>(
          create: (context) => LocalStorageServiceImpl(),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryLocalStorageImpl(
            localStorageService: context.read(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read())..add(const AuthEvent.started()),
          ),
        ],
        child: const App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: switch (state) {
            AuthStateAuthenticated() => const PdfScreen(),
            AuthStateUnAuthenticated() => const AuthScreen(),
            AuthInitial() => const SplashScreen(),
          },
        );
      },
    );
  }
}
