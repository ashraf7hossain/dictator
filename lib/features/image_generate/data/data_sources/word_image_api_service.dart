import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/features/image_generate/data/model/word_image_model.dart';

const apiUrl = "https://4c5n91l2-5000.asse.devtunnels.ms/search_google";

class InputData {
  final String search;

  InputData({required this.search});

  // Convert InputData instance to a JSON-like Map
  Map<String, dynamic> toJson() {
    return {'search': search};
  }
}

abstract class WordImageApiService {
  Future<WordImageModel> getWordImages(String word);
}

class WordImageApiServiceImpl implements WordImageApiService {
  final Dio dio;

  WordImageApiServiceImpl({required this.dio});

  @override
  Future<WordImageModel> getWordImages(String word) async {
    final InputData data = InputData(search: word);
    final response = await dio.post(
      "https://4c5n91l2-5000.asse.devtunnels.ms/search_google",
      data: data.toJson(),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    debugPrint("here is the response");
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return WordImageModel(
          images: data.map((json) => json.toString()).toList());
    } else {
      throw DioException;
    }
  }
}
