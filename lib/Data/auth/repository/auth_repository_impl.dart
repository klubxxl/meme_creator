import 'package:injectable/injectable.dart';
import 'package:meme_creator/Data/auth/data_sources/auth_login_api_data_source.dart';

import 'package:meme_creator/Data/auth/data_sources/auth_register_api_data_source.dart';
import 'package:meme_creator/Data/auth/mapper/auth_dto_to_auth_mapper.dart';
import 'package:meme_creator/Domain/auth/model/auth.dart';
import 'package:meme_creator/Domain/auth/repository/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._authDataSource, this._authDtoToAuthMapper,
      this._authDataSourceLogin);

  final RegisterApiDataSource _authDataSource;
  final LoginApiDataSource _authDataSourceLogin;
  final AuthDtoToAuthMapper _authDtoToAuthMapper;

  @override
  Future<Auth> signUp(String email, String password) async {
    final authDto =
        await _authDataSource.signUp(email: email, password: password);

    return _authDtoToAuthMapper(authDto);
  }

  @override
  Future<Auth> signIn(String email, String password) async {
    final authDto =
        await _authDataSourceLogin.signIn(email: email, password: password);

    return _authDtoToAuthMapper(authDto);
  }
}
