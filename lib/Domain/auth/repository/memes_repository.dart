import 'package:meme_creator/Domain/auth/model/memes.dart';

abstract class MemesRepository {
  Future<Memes> fetchMyMemes(String userId);
  Future<Memes> fetchMemes();
  Future<void> uploadMeme(
      String userId, String imageUrl, String topText, String bottomText);
}
