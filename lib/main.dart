import 'package:bloc_sample/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_sample/pages/home_page.dart';
// import 'package:bloc_sample/pages/login_page.dart';
import 'package:bloc_sample/auth_bloc/auth_bloc.dart';
import 'package:bloc_sample/auth_bloc/auth_state.dart';
// import 'package:bloc_sample/auth_bloc/auth_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
          title: 'FLutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is AuthLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is AuthSuccess) {
              return const HomePage();
            }
            return const LoginPage();
          })),
    );
  }
}
