import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/home/presentation/bloc/word_bloc.dart';
import 'package:myapp/features/home/presentation/bloc/word_state.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteWordBloc, RemoteWordState>(
        builder: (context, state) {
      if (state is RemoteWordLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is RemoteWordSuccess) {
        return Text(state.word![0].meanings![0].definitions![0].definition);
      } else if (state is RemoteWordFailed) {
        return Text(state.exception.toString());
      } else {
        return const Text("Something went wrong");
      }
      // return Center(
      //     child: Column(
      //   children: [
      //     Container(
      //       margin: const EdgeInsets.all(8.0),
      //       child: CustomInputField(
      //         label: "",
      //         prefixIcon: Icons.search,
      //         placeholder: "Search a word",
      //         controller: searchController,
      //         keyboardType: TextInputType.text,
      //         maxLines: 1,
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 20,
      //     )
      //   ],
      // ));
    });
  }
}
