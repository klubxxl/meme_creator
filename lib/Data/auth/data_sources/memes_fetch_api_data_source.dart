import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:meme_creator/Data/api_routes.dart';
import 'package:meme_creator/Data/auth/model/memes_dto.dart';

@injectable
class MemesFetchApiDataSource {
  Future<MemesDto> fetchMemes() async {
    final result = await http.get(
      Uri.parse(ApiRoutes.memes),
    );

    final json = jsonDecode(result.body);
    return MemesDto(json);
  }
}
