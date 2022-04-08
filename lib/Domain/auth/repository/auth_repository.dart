import 'package:meme_creator/Domain/auth/model/auth.dart';

abstract class AuthRepository {
  Future<Auth> signUp(String email, String password);
  Future<Auth> signIn(String email, String password);
}
