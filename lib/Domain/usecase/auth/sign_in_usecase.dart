import 'package:injectable/injectable.dart';
import 'package:meme_creator/Domain/auth/model/auth.dart';
import 'package:meme_creator/Domain/auth/repository/auth_repository.dart';

@injectable
class SignInUsecase {
  SignInUsecase(this._authRepository);

  final AuthRepository _authRepository;

  Future<Auth> call(String email, String password) =>
      _authRepository.signIn(email, password);
}
