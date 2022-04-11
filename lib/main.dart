import 'package:flutter/material.dart';
import 'package:meme_creator/Presentation/Pages/screenNavigator/navigator_page.dart';

import 'Injectable/injectable.dart';

void main() {
  configureDependencies();
  runApp(const MemeCreatorApp());
}

class MemeCreatorApp extends StatelessWidget {
  const MemeCreatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'meme creator',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const NavigatorPage());
  }
}
