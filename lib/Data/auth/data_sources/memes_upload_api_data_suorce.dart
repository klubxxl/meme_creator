import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:meme_creator/Data/api_routes.dart';

@injectable
class MemesUploadApiDataSource {
  Future<void> uploadMeme({
    required String creatorId,
    required String imageUrl,
    required String topText,
    required String downText,
  }) async {
    await http.put(
      Uri.parse(ApiRoutes.memes),
      body: {
        'imageUrl': imageUrl,
        'topText': topText,
        'downText': downText,
        'creatorId': creatorId
      },
    );
  }
}
