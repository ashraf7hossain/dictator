import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/image_generate/presentation/bloc/word_image_bloc.dart';
import 'package:myapp/features/image_generate/presentation/bloc/word_image_state.dart';

class PromptResult extends StatelessWidget {
  const PromptResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteWordImagesBloc, RemoteWordImagesState>(
        builder: (context, state) {
      if (state is RemoteWordImagesLoading) {
        return const CircularProgressIndicator();
      }
      if (state is RemoteWordImagesSuccess) {
        return Expanded(child: Text(state.wordImages!.images[0]));
      }
      if (state is RemoteWordImagesFailed) {
        return Text(state.exception.toString());
      } else {
        return const Text("Unknow error ");
      }
    });
  }
}
