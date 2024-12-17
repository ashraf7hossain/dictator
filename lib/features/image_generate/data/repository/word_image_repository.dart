import 'package:dio/dio.dart';
import 'package:myapp/core/resources/data_state.dart';
import 'package:myapp/features/image_generate/data/data_sources/word_image_api_service.dart';
import 'package:myapp/features/image_generate/data/model/word_image_model.dart';
import 'package:myapp/features/image_generate/domain/repository/word_image_repository.dart';

class WordImageRepositoryImpl implements WordImageRepository {
  final WordImageApiService wordImageApiService;

  WordImageRepositoryImpl({required this.wordImageApiService});

  @override
  Future<DataState<WordImageModel>> getWordImages(String word) async {
    try {
      final remoteData = await wordImageApiService.getWordImages(word);
      return DataSuccess(remoteData);
    } catch (e) {
      if (e is DioException) {
        return DataFailed(e);
      } else {
        return DataFailed(DioException(
          requestOptions: RequestOptions(path: ''),
          error: e.toString(),
        ));
      }
    }
  }
}
