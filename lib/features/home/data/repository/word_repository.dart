import 'package:dio/dio.dart';
import 'package:myapp/core/resources/data_state.dart';
import 'package:myapp/features/home/data/data_sources/word_api_service.dart';
import 'package:myapp/features/home/data/models/word_model.dart';
import 'package:myapp/features/home/domain/repository/word_repository.dart';

class WordRepositoryImpl implements WordRepository {
  final WordApiService wordApiService;

  WordRepositoryImpl({required this.wordApiService});

  @override
  Future<DataState<List<WordModel>>> getWord(String word) async {
    try {
      final remoteData = await wordApiService.getWord(word);
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
