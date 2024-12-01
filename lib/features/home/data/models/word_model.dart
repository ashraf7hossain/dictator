import 'package:myapp/features/home/domain/entity/word.dart';

import 'package:myapp/features/home/domain/entity/word.dart';

class WordModel extends WordEntity {
  const WordModel({
    required String word,
    required String phonetic,
    required List<PhoneticModel> phonetics,
    required List<MeaningModel> meanings,
    required List<String> synonyms,
    required List<String> antonyms,
    required List<String> sourceUrls,
  }) : super(
          word: word,
          phonetic: phonetic,
          phonetics: phonetics,
          meanings: meanings,
          synonyms: synonyms,
          antonyms: antonyms,
          sourceUrls: sourceUrls,
        );

  /// Converts a JSON map into a WordModel
  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word: json['word'] ?? '',
      phonetic: json['phonetic'] ?? '',
      phonetics: (json['phonetics'] as List<dynamic>?)
              ?.map((e) => PhoneticModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      meanings: (json['meanings'] as List<dynamic>?)
              ?.map((e) => MeaningModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      synonyms: List<String>.from(json['meanings'][0]['synonyms'] ?? []),
      antonyms: List<String>.from(json['meanings'][0]['antonyms'] ?? []),
      sourceUrls: List<String>.from(json['sourceUrls'] ?? []),
    );
  }

  /// Converts a WordModel into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'phonetic': phonetic,
      'phonetics': phonetics.map((e) => (e as PhoneticModel).toJson()).toList(),
      'meanings': meanings.map((e) => (e as MeaningModel).toJson()).toList(),
      'synonyms': synonyms,
      'antonyms': antonyms,
      'sourceUrls': sourceUrls,
    };
  }
}

/// Sub-models for Phonetic and Meaning

class PhoneticModel extends Phonetic {
  const PhoneticModel({
    required String text,
    String? audio,
  }) : super(text: text, audio: audio);

  factory PhoneticModel.fromJson(Map<String, dynamic> json) {
    return PhoneticModel(
      text: json['text'] ?? '',
      audio: json['audio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'audio': audio,
    };
  }
}

class MeaningModel extends Meaning {
  const MeaningModel({
    required String partOfSpeech,
    required List<DefinitionModel> definitions,
  }) : super(partOfSpeech: partOfSpeech, definitions: definitions);

  factory MeaningModel.fromJson(Map<String, dynamic> json) {
    return MeaningModel(
      partOfSpeech: json['partOfSpeech'] ?? '',
      definitions: (json['definitions'] as List<dynamic>?)
              ?.map((e) => DefinitionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'partOfSpeech': partOfSpeech,
      'definitions': definitions.map((e) => (e as DefinitionModel).toJson()).toList(),
    };
  }
}

class DefinitionModel extends Definition {
  const DefinitionModel({
    required String definition,
    required List<String> synonyms,
    required List<String> antonyms,
  }) : super(definition: definition, synonyms: synonyms, antonyms: antonyms);

  factory DefinitionModel.fromJson(Map<String, dynamic> json) {
    return DefinitionModel(
      definition: json['definition'] ?? '',
      synonyms: List<String>.from(json['synonyms'] ?? []),
      antonyms: List<String>.from(json['antonyms'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'definition': definition,
      'synonyms': synonyms,
      'antonyms': antonyms,
    };
  }
}
