import 'package:injectable/injectable.dart';
import 'package:meme_creator/Domain/auth/model/memes.dart';
import 'package:meme_creator/Domain/auth/repository/memes_repository.dart';

@injectable
class FetchMyMemesUsecase {
  FetchMyMemesUsecase(this._memesRepository);

  final MemesRepository _memesRepository;

  Future<Memes> call(String creatorId) =>
      _memesRepository.fetchMyMemes(creatorId);
}
