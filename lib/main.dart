import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/core/config/routes.dart';
import 'package:myapp/core/theme/app_theme.dart';
import 'package:myapp/features/home/presentation/bloc/word_bloc.dart';
import 'package:myapp/features/home/presentation/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

@pragma("vm:entry-point")
void overlayMain(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dictator",
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: Routes.getRoutes(),
      home: BlocProvider(
        create: (context) => RemoteWordBloc(),
        child: HomeScreen(), // Pass HomeScreen as child
      ),
    );
  }
}
