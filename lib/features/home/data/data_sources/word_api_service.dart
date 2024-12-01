import 'package:dio/dio.dart';
import 'package:myapp/features/home/data/models/word_model.dart';

const apiUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/";

abstract class WordApiService {
  Future<List<WordModel>> getWord(String word);
}

class WordApiServiceImpl implements WordApiService {
  final Dio dio;

  WordApiServiceImpl({required this.dio});

  @override
  Future<List<WordModel>> getWord(String word) async {
    final response = await dio.get("https://api.dictionaryapi.dev/api/v2/entries/en/$word");

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((json) => WordModel.fromJson(json)).toList();
    } else {
      throw DioException;
    }
  }
}
