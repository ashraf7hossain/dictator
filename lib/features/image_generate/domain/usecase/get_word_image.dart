import 'package:myapp/core/resources/data_state.dart';
import 'package:myapp/features/image_generate/domain/entity/word_image.dart';
import 'package:myapp/features/image_generate/domain/repository/word_image_repository.dart';

class GetWordImageUseCase {
  final WordImageRepository wordImageRepository;

  GetWordImageUseCase(this.wordImageRepository);

  Future<DataState<WordImageEntity>> call(String word) async {
    return await wordImageRepository.getWordImages(word);
  }
}
