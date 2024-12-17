import 'package:equatable/equatable.dart';

class WordImageEntity extends Equatable {
  final List<String> images;

  const WordImageEntity({required this.images});

  @override
  List<Object?> get props => [images];
}
