import 'package:convoconnect/features.auth/domain/entities/user_entity.dart';
import 'package:convoconnect/features.auth/domain/repositories/auth_repo.dart';

class LoginUsercase {
  final AuthRepository repository;
  LoginUsercase({required this.repository});

  Future<UserEntity> call(String email, String password) {
    return repository.login(email, password);
  }
}
