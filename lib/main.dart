import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_editor/features/auth/data/auth_repository_mock_impl.dart';
import 'package:pdf_editor/features/auth/domain/auth_repository.dart';
import 'package:pdf_editor/features/auth/logic/auth/auth_bloc.dart';
import 'package:pdf_editor/features/pdf/presentation/pdf_screen.dart';
import 'package:pdf_editor/features/splash/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryMockImpl(),
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
          home: state is AuthStateAuthenticated ? const PdfScreen() : const SplashScreen(),
        );
      },
    );
  }
}
