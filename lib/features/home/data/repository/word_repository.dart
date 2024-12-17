import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/core/config/cache.dart';
import 'package:myapp/core/resources/data_state.dart';
import 'package:myapp/features/home/data/data_sources/word_api_service.dart';
import 'package:myapp/features/home/data/models/word_model.dart';
import 'package:myapp/features/home/domain/repository/word_repository.dart';

class WordRepositoryImpl implements WordRepository {
  final WordApiService wordApiService;

  WordRepositoryImpl({required this.wordApiService});

  @override
  Future<DataState<List<WordModel>>> getWord(String word) async {
    var box = await Hive.openBox(CacheKey.cachedWords);

    final cachedResponse = box.get(word);

    if (cachedResponse != null) {
      List<dynamic> data = jsonDecode(cachedResponse);
      return DataSuccess(data.map((json) => WordModel.fromJson(json)).toList());
    }

    try {
      final remoteData = await wordApiService.getWord(word);
      box.put(word, jsonEncode(remoteData));
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
