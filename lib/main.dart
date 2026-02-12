import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color appBarColor = Color(0xFF147CD3);
const Color bodyColor = Color(0xFF2196F3);
const Color buttonColor = Color(0xFF147CD3);
const Color textColor = Colors.white;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: appBarColor),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        foregroundColor: textColor,
        title: const Text("Random Number Generator"),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: null,
        ),
      ),
      body: const Center(
        child: Text(
          "",
          style: TextStyle(fontSize: 50, color: textColor),
        ),
      ),
    );
  }
}
