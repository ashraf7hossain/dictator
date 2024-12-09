import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/features/home/domain/entity/word.dart';

abstract class RemoteWordState extends Equatable {
  final List<WordEntity>? word;
  final DioException? exception;

  const RemoteWordState({this.word, this.exception});

  @override
  List<Object> get props => [word!, exception!];
}

class RemoteWordInitial extends RemoteWordState {
  const RemoteWordInitial();
}

class RemoteWordLoading extends RemoteWordState {
  const RemoteWordLoading();
}

class RemoteWordSuccess extends RemoteWordState {
  const RemoteWordSuccess(List<WordEntity> word) : super(word: word);
}

class RemoteWordFailed extends RemoteWordState {
  const RemoteWordFailed(DioException exception) : super(exception: exception);
}
