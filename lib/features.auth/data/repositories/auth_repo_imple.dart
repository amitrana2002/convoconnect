import 'package:convoconnect/features.auth/data/datasources/auth_remote_data.dart';
import 'package:convoconnect/features.auth/domain/entities/user_entity.dart';
import 'package:convoconnect/features.auth/domain/repositories/auth_repo.dart';

class AuthRepoImple extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImple({required this.authRemoteDataSource});

  @override
  Future<UserEntity> login(String email, String password) async {
    return await authRemoteDataSource.login(email: email, password: password);
  }

  @override
  Future<UserEntity> register(
    String username,
    String email,
    String password,
  ) async {
    return authRemoteDataSource.register(
      username: username,
      email: email,
      password: password,
    );
  }
}
