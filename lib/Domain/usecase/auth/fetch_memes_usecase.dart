import 'package:injectable/injectable.dart';
import 'package:meme_creator/Domain/auth/model/memes.dart';
import 'package:meme_creator/Domain/auth/repository/memes_repository.dart';

@injectable
class FetchMemesUsecase {
  FetchMemesUsecase(this._memesRepository);

  final MemesRepository _memesRepository;

  Future<Memes> call() => _memesRepository.fetchMemes();
}
