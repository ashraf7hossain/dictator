import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/extensions/string.dart';
import 'package:myapp/features/home/domain/entity/word.dart';
import 'package:myapp/features/home/presentation/bloc/word_bloc.dart';
import 'package:myapp/features/home/presentation/bloc/word_state.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteWordBloc, RemoteWordState>(
        builder: (context, state) {
      if (state is RemoteWordInitial) {
        return const Text("Search a word");
      } else if (state is RemoteWordLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is RemoteWordSuccess) {
        return WordContent(word: state.word![0]);
      } else if (state is RemoteWordFailed) {
        return Text(state.exception.toString());
      } else {
        return const Text("Something went wrong");
      }
    });
  }
}

class WordContent extends StatelessWidget {
  final WordEntity word;
  const WordContent({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                word.word.capitalize(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...word.meanings.map((w) {
                return WordMeaningTile(meaning: w);
              })
            ],
          ),
        ),
      ),
    );
  }
}

class WordMeaningTile extends StatelessWidget {
  final Meaning meaning;

  const WordMeaningTile({Key? key, required this.meaning}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            meaning.partOfSpeech.capitalize(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 20),
        ...meaning.definitions.map((d) {
          return Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Text(
                    d.definition.capitalize(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          color: Colors.black, fontSize: 16), // Default style
                      children: [
                        ...d.synonyms.map((s) {
                          return TextSpan(
                            text:
                                '$s ', // Add a space or any delimiter after each synonym
                            style: const TextStyle(
                                color:
                                    Colors.blue), // Customize style if needed
                          );
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ]);
        }),
      ]),
    );
  }
}
