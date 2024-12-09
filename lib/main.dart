import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/theme/app_theme.dart';
import 'package:myapp/features/home/presentation/bloc/word_bloc.dart';
import 'package:myapp/features/home/presentation/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dictator",
      theme: AppTheme.lightTheme,
      home: BlocProvider(
        create: (context) => RemoteWordBloc(),
        child: HomeScreen(), // Pass HomeScreen as child
      ),
    );
  }
}
