import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color appBarColor = Color(0xFF147CD3);
const Color bodyColor = Color(0xFF2196F3);
const Color buttonColor = Color(0xFF147CD3);
const Color textColor = Colors.white;

const TextStyle numberTextStyle = TextStyle(
  fontSize: 70,
  fontWeight: FontWeight.bold,
  color: textColor,
);

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? currentNumber;
  final Random random = Random();

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: buttonColor,
    foregroundColor: textColor,
    elevation: 5,
    minimumSize: const Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    textStyle: const TextStyle(fontSize: 18),
  );

  void generateNumber() {
    setState(() {
      currentNumber = random.nextInt(9) + 1;
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: currentNumber == null
                    ? const SizedBox()
                    : Text(
                        currentNumber.toString(),
                        style: numberTextStyle,
                      ),
              ),
            ),
            ElevatedButton(
              style: buttonStyle,
              onPressed: generateNumber,
              child: const Text("Generate"),
            ),
          ],
        ),
      ),
    );
  }
}
