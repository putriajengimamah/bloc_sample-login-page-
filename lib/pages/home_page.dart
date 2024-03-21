import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_sample/auth_bloc/auth_event.dart';
import 'package:bloc_sample/auth_bloc/auth_bloc.dart';
import 'package:bloc_sample/auth_bloc/auth_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          actions: const [],
        ),
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                        'Hi ${state.name}, Welcome to Mobile Development')),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LogoutEvent());
                    },
                    child: const Text('Logout')),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
