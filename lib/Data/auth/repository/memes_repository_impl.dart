import 'package:injectable/injectable.dart';
import 'package:meme_creator/Data/auth/data_sources/memes_fetch_api_data_source.dart';
import 'package:meme_creator/Data/auth/data_sources/memes_upload_api_data_suorce.dart';
import 'package:meme_creator/Data/auth/mapper/memes_dto_to_memes_mapper.dart';
import 'package:meme_creator/Domain/auth/model/memes.dart';
import 'package:meme_creator/Domain/auth/repository/memes_repository.dart';

@Singleton(as: MemesRepository)
class MemesRepositoryImpl extends MemesRepository {
  MemesRepositoryImpl(this._memesUploadDataSource, this._memesFetchDataSource,
      this._dtoToMemesMapper);

  final MemesUploadApiDataSource _memesUploadDataSource;
  final MemesFetchApiDataSource _memesFetchDataSource;
  final MemesDtoToMemesMapper _dtoToMemesMapper;

  @override
  Future<Memes> fetchMemes() async {
    final memesDto = await _memesFetchDataSource.fetchMemes();

    return _dtoToMemesMapper(memesDto);
  }

  @override
  Future<Memes> fetchMyMemes(String userId) async {
    var memesDto = await _memesFetchDataSource.fetchMemes();
    memesDto.memesMap.removeWhere((key, value) => value['creatorId'] != userId);

    return _dtoToMemesMapper(memesDto);
  }

  @override
  Future<void> uploadMeme(
      String userId, String imageUrl, String topText, String bottomText) async {
    _memesUploadDataSource.uploadMeme(
        creatorId: userId,
        imageUrl: imageUrl,
        topText: topText,
        downText: bottomText);
  }
}
