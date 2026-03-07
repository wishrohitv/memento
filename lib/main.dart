import 'package:flutter/material.dart';
import 'package:memento/core/constants/app_constants.dart';
import 'package:memento/features/home/view/pages/home_page.dart';
import 'package:memento/core/theme/default_theme.dart';

void main() {
  runApp(const MomentoApp());
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
