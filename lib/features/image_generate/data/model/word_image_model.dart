import 'package:myapp/features/image_generate/domain/entity/word_image.dart';

class WordImageModel extends WordImageEntity{
  const WordImageModel({
    required List<String> images,
  }) : super(images: images);

  factory WordImageModel.fromJson(Map<String,dynamic> json){
    return WordImageModel(
      images: List<String>.from(json['images']),
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'images': images,
    };
  }
}