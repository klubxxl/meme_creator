import 'package:injectable/injectable.dart';
import 'package:meme_creator/Domain/auth/repository/memes_repository.dart';

@injectable
class UploadMemesUsecase {
  UploadMemesUsecase(this._memesRepository);

  final MemesRepository _memesRepository;

  Future<void> call(String creatorId, String imageUrl, String topText,
          String bottomText) =>
      _memesRepository.uploadMeme(creatorId, imageUrl, topText, bottomText);
}
