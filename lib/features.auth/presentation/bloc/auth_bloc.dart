import 'package:convoconnect/features.auth/domain/usecases/login_usercase.dart';
import 'package:convoconnect/features.auth/domain/usecases/resigter_usecase.dart';
import 'package:convoconnect/features.auth/presentation/bloc/auth_event.dart';
import 'package:convoconnect/features.auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUsercase registerUsercase;
  final LoginUsercase loginUsercase;
  final _storage = FlutterSecureStorage();

  AuthBloc({required this.registerUsercase, required this.loginUsercase})
    : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
  }
  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await registerUsercase(
        event.username,
        event.email,
        event.password,
      );
      emit(AuthSuccess(message: "Registration Successful"));
    } catch (e) {
      emit(AuthFailure(errorMessage: "Registration Failed"));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await loginUsercase(event.email, event.password);
      await _storage.write(key: 'auth_token', value: ' user.token');
      emit(AuthSuccess(message: "Login Successful"));
    } catch (e) {
      emit(AuthFailure(errorMessage: "Login Failed"));
    }
  }
}
