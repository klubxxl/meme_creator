import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meme_creator/Domain/auth/model/auth.dart';
import 'package:meme_creator/Domain/auth/model/memes.dart';
import 'package:meme_creator/Domain/usecase/auth/fetch_memes_usecase.dart';
import 'package:meme_creator/Domain/usecase/auth/fetch_my_memes_usecase.dart';
import 'package:meme_creator/Domain/usecase/auth/upload_meme_usecase.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

@injectable
class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc(
    this._uploadMemesUsecase,
    this._fetchMemesUsecase,
    this._fetchMyMemesUsecase,
    this._auth,
  ) : super(DownloadingMemes()) {
    on<ChangeIntoFirstScreenEvent>((event, emit) {
      emit(HomepageFirst(myMemes));
    });
    on<ChangeIntoSeccondScreenEvent>((event, emit) {
      emit(HomepageSeccond(memes));
    });
    on<FetchMemesDataEvent>((event, emit) async {
      try {
        emit(DownloadingMemes());
        memes = await _fetchMemesUsecase();
        myMemes = await _fetchMyMemesUsecase(_auth.userId);
        emit(HomepageFirst(myMemes));
      } catch (e) {
        emit(ErrorMemes());
      }
    });
  }

  final UploadMemesUsecase _uploadMemesUsecase;
  final FetchMemesUsecase _fetchMemesUsecase;
  final FetchMyMemesUsecase _fetchMyMemesUsecase;
  final Auth _auth;

  late Memes memes;
  late Memes myMemes;
}
