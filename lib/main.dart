import 'package:final_project/ui/chat_bot_page.dart';
import 'package:final_project/ui/home_page.dart';
import 'package:final_project/ui/start_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
    // Startpage();
  }
}
