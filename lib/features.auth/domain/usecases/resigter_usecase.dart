import 'package:convoconnect/features.auth/domain/entities/user_entity.dart';
import 'package:convoconnect/features.auth/domain/repositories/auth_repo.dart';

class RegisterUsercase {
  final AuthRepository repository;
  RegisterUsercase({required this.repository});

  Future<UserEntity> call(String username, String email, String password) {
    return repository.register(username, email, password);
  }
}
