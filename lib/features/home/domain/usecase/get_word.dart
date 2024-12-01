import 'package:myapp/core/resources/data_state.dart';
import 'package:myapp/features/home/domain/entity/word.dart';
import 'package:myapp/features/home/domain/repository/word_repository.dart';

class GetWordUseCase {
  final WordRepository wordRepository;

  GetWordUseCase(this.wordRepository);

  Future<DataState<List<WordEntity>>> call(String word) async {
    return await wordRepository.getWord(word);
  }
}
