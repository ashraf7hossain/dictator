import 'package:myapp/core/resources/data_state.dart';
import 'package:myapp/features/home/domain/entity/word.dart';

abstract class WordRepository {
  Future<DataState<List<WordEntity>>> getWord(String word);
}
