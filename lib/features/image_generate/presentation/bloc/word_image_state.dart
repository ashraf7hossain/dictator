import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/features/image_generate/domain/entity/word_image.dart';

abstract class RemoteWordImagesState extends Equatable {
  final WordImageEntity? wordImages;
  final DioException? exception; 

  const RemoteWordImagesState({this.wordImages, this.exception});

  @override
  List<Object?> get props => [wordImages];
}

class RemoteWordImagesInitial extends RemoteWordImagesState {
  const RemoteWordImagesInitial();
}

class RemoteWordImagesLoading extends RemoteWordImagesState {
  const RemoteWordImagesLoading();
}

class RemoteWordImagesSuccess extends RemoteWordImagesState {
  const RemoteWordImagesSuccess(WordImageEntity wordImages) : super(wordImages: wordImages);
}

class RemoteWordImagesFailed extends RemoteWordImagesState {
  const RemoteWordImagesFailed(DioException exception) : super(exception: exception);
}