import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:myapp/core/resources/data_state.dart';
import 'package:myapp/features/home/domain/repository/word_repository.dart';
import 'package:myapp/features/home/data/data_sources/word_api_service.dart';
import 'package:myapp/features/home/domain/usecase/get_word.dart';
import 'package:myapp/features/home/presentation/bloc/word_events.dart';
import 'package:myapp/features/home/presentation/bloc/word_state.dart';
// import 'package:myapp/features/home/data/data_sources/word_api_service.dart';
import 'package:myapp/features/home/data/repository/word_repository.dart';

class RemoteWordBloc extends Bloc<RemoteWordEvent,RemoteWordState >{
  RemoteWordBloc() : super(const RemoteWordLoading()) {
    on <GetWordEvent>(onGetWord);
  }

  void onGetWord(GetWordEvent event, Emitter<RemoteWordState>emit) async {
    WordApiServiceImpl wordApiService = WordApiServiceImpl(dio: Dio());
    WordRepository repository = WordRepositoryImpl(
      wordApiService: wordApiService
    );
    final fetchedData = await GetWordUseCase(repository).call(event.word);
    
    if (fetchedData is DataSuccess && fetchedData.data!.isNotEmpty) {
      emit(RemoteWordSuccess(fetchedData.data!));
    }

    if(fetchedData is DataFailed) {
      emit(RemoteWordFailed(fetchedData.exception!));
    }

  }
}
