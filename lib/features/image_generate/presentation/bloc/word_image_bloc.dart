import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/core/resources/data_state.dart';
import 'package:myapp/features/image_generate/data/data_sources/word_image_api_service.dart';
import 'package:myapp/features/image_generate/data/repository/word_image_repository.dart';
import 'package:myapp/features/image_generate/domain/repository/word_image_repository.dart';
import 'package:myapp/features/image_generate/domain/usecase/get_word_image.dart';
import 'package:myapp/features/image_generate/presentation/bloc/word_image_event.dart';
import 'package:myapp/features/image_generate/presentation/bloc/word_image_state.dart';

class RemoteWordImagesBloc
    extends Bloc<RemoteWordImagesEvent, RemoteWordImagesState> {
  RemoteWordImagesBloc() : super(const RemoteWordImagesInitial()) {
    on<GetWordImagesEvent>(onGetWordImages);
  }

  void onGetWordImages(
      GetWordImagesEvent event, Emitter<RemoteWordImagesState> emit) async {
    emit(const RemoteWordImagesLoading());
    debugPrint("here we go");
    WordImageApiService wordImageApiService =
        WordImageApiServiceImpl(dio: Dio());
    WordImageRepository repository =
        WordImageRepositoryImpl(wordImageApiService: wordImageApiService);

    final fetchedData = await GetWordImageUseCase(repository).call(event.word);

    if (fetchedData is DataSuccess && fetchedData.data != null) {
      emit(RemoteWordImagesSuccess(fetchedData.data!));
    } else {
      emit(RemoteWordImagesFailed(fetchedData.exception!));
    }
  }
}
