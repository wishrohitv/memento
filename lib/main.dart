import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:memento/core/constants/app_constants.dart';
import 'package:memento/features/home/view/pages/home_page.dart';
import 'package:memento/core/theme/default_theme.dart';
import 'package:memento/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

late Isar isar;

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewmodel>(create: (_) => HomeViewmodel()),
      ],
      child: const MomentoApp(),
    ),
  );
}

class MomentoApp extends StatelessWidget {
  const MomentoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      title: appName,
      home: HomePage(),
    );
  }
}
