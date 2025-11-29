import 'package:convoconnect/core/theme.dart';
import 'package:convoconnect/features.auth/data/datasources/auth_remote_data.dart';
import 'package:convoconnect/features.auth/data/repositories/auth_repo_imple.dart';
import 'package:convoconnect/features.auth/domain/repositories/auth_repo.dart';
import 'package:convoconnect/features.auth/domain/usecases/login_usercase.dart';
import 'package:convoconnect/features.auth/domain/usecases/resigter_usecase.dart';
import 'package:convoconnect/features.auth/presentation/bloc/auth_bloc.dart';
import 'package:convoconnect/features.auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final AuthRepository authRepository = AuthRepoImple(
    authRemoteDataSource: AuthRemoteDataSource(),
  );
  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  const MyApp({super.key, required this.authRepository});

  // This widget is the root   of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => AuthBloc(
                registerUsercase: RegisterUsercase(repository: authRepository),
                loginUsercase: LoginUsercase(repository: authRepository),
              ),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,

        home: LoginPage(),
      ),
    );
  }
}
