import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/login_screen.dart';
import 'package:twitter_clone/screens/post_detail_screen.dart';
import 'package:twitter_clone/screens/posts_screen.dart';
import 'package:twitter_clone/screens/signup_screen.dart';
import 'package:twitter_clone/widgets/sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SignUpScreen(),
    );
  }
}
