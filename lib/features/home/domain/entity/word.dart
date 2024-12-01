import 'package:equatable/equatable.dart';

class WordEntity extends Equatable {
  final String word;
  final String phonetic;
  final List<Phonetic> phonetics;
  final List<Meaning> meanings;
  final List<String> synonyms;
  final List<String> antonyms;
  final List<String> sourceUrls;

  const WordEntity({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.synonyms,
    required this.antonyms,
    required this.sourceUrls,
  });

  @override
  List<Object?> get props => [
        word,
        phonetic,
        phonetics,
        meanings,
        synonyms,
        antonyms,
        sourceUrls,
      ];
}

class Phonetic extends Equatable {
  final String text;
  final String? audio;

  const Phonetic({
    required this.text,
    this.audio,
  });

  @override
  List<Object?> get props => [text, audio];
}

class Meaning extends Equatable {
  final String partOfSpeech;
  final List<Definition> definitions;

  const Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  @override
  List<Object?> get props => [partOfSpeech, definitions];
}

class Definition extends Equatable {
  final String definition;
  final List<String> synonyms;
  final List<String> antonyms;

  const Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
  });

  @override
  List<Object?> get props => [definition, synonyms, antonyms];
}
