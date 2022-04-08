import 'package:injectable/injectable.dart';
import 'package:meme_creator/Domain/auth/model/auth.dart';
import 'package:meme_creator/Domain/auth/repository/auth_repository.dart';

@injectable
class SignUpUsecase {
  SignUpUsecase(this._authRepository);

  final AuthRepository _authRepository;

  Future<Auth> call(String email, String password) =>
      _authRepository.signUp(email, password);
}
