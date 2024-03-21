import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_sample/auth_bloc/auth_state.dart';
import 'package:bloc_sample/auth_bloc/auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(
      (event, emit) async {
        emit(AuthLoading());
        await Future.delayed(const Duration(seconds: 5));
        emit(AuthSuccess(name: 'Putri Ajeng Imamah'));
      },
    );

    on<LogoutEvent>(
      (event, emit) async {
        emit(AuthLoading());
        await Future.delayed(const Duration(seconds: 5));
        emit(AuthInitial());
      },
    );
  }
}
