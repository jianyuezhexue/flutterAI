import 'package:flutter/material.dart';
import 'router/routers.dart';

void main() {
  runApp(const MyApp());
}

// main
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI 小助手',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 242, 0),
        ),
        splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
        highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
      ),
      onGenerateRoute: Routes.genRoute,
      initialRoute: '/',
    );
  }
}
