import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/widgets/input.dart';
import 'package:myapp/features/home/presentation/bloc/word_bloc.dart';
import 'package:myapp/features/home/presentation/bloc/word_events.dart';
import 'package:myapp/features/home/presentation/bloc/word_state.dart';
import 'package:myapp/features/home/presentation/widgets/home_content.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RemoteWordBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dictator"),
        ),
        body: const HomeContent()
      )
    );
  }
}
