import 'package:injectable/injectable.dart';
import 'package:meme_creator/Data/auth/model/auth_dto.dart';
import 'package:meme_creator/Domain/auth/model/auth.dart';

@injectable
class AuthDtoToAuthMapper {
  Auth call(AuthDto dto) => Auth(dto.token);
}
