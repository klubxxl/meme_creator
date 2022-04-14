import 'package:injectable/injectable.dart';
import 'package:meme_creator/Data/auth/model/memes_dto.dart';
import 'package:meme_creator/Domain/auth/model/memes.dart';

@injectable
class MemesDtoToMemesMapper {
  Memes call(MemesDto dto) => Memes(dto.memesMap);
}
