import 'package:flutter/material.dart';
import 'package:integration/app/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
