import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:meme_creator/Data/api_routes.dart';
import 'package:meme_creator/Data/auth/model/auth_dto.dart';

@injectable
class RegisterApiDataSource {
  Future<AuthDto> signUp({
    required String email,
    required String password,
  }) async {
    final result = await http.post(
      Uri.parse(ApiRoutes.signUp),
      body: {'email': email, 'password': password},
    );

    final json = jsonDecode(result.body);
    return AuthDto(json['token']);
  }
}
