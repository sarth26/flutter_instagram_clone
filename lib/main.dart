import 'package:flutter/material.dart';
import 'package:instagram_clone_assignment/navigation/bottomnavigation_screen.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone_assignment/providers/post_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider()..loadPosts(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationScreen()
    );
  }
}