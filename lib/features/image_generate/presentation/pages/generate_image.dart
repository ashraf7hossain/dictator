import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/image_generate/presentation/bloc/word_image_bloc.dart';
import 'package:myapp/features/image_generate/presentation/widgets/prompt_form.dart';
import 'package:myapp/features/image_generate/presentation/widgets/prompt_result.dart';

class GenerateImage extends StatelessWidget {
  const GenerateImage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    return BlocProvider(
      create: (context) => RemoteWordImagesBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dictator"),
        ),
        body: Center(
            child: Column(
          children: [
            PromptForm(word: args?['word']),
            const SingleChildScrollView(child: PromptResult())
          ],
        )),
      ),
    );
  }
}
