import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/config/routes.dart';
import 'package:myapp/core/widgets/input.dart';
import 'package:myapp/core/widgets/popup_menu.dart';
import 'package:myapp/features/home/presentation/bloc/word_bloc.dart';
import 'package:myapp/features/home/presentation/bloc/word_events.dart';
import 'package:myapp/features/home/presentation/widgets/home_content.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictator"),
        actions: [
          const PopupMenu()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.generateImage, arguments: {
            'word': searchController.text,
          });
        },
        child: const Icon(Icons.auto_awesome),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              child: CustomInputField(
                label: "",
                prefixIcon: Icons.search,
                placeholder: "Search a word",
                controller: searchController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                onChanged: (value) {
                  // debugPrint("debugging value => $value");
                  if (_debounce?.isActive ?? false) _debounce?.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    if (value.isNotEmpty) {
                      context
                          .read<RemoteWordBloc>()
                          .add(GetWordEvent(word: value));
                    }
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: HomeContent()),
          ],
        ),
      ),
    );
  }
}
