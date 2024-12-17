import 'package:myapp/core/resources/data_state.dart';
import 'package:myapp/features/image_generate/domain/entity/word_image.dart';

abstract class WordImageRepository {
  Future<DataState<WordImageEntity>> getWordImages(String word);
}
