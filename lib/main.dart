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

const TextStyle statsTextStyle = TextStyle(
  fontSize: 18,
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

  final Map<int, int> stats = {for (int i = 1; i <= 9; i++) i: 0};

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
      stats[currentNumber!] = stats[currentNumber!]! + 1;
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
            const SizedBox(height: 15),
            ElevatedButton(
              style: buttonStyle,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StatisticsPage(
                      stats: stats,
                      buttonStyle: buttonStyle,
                    ),
                  ),
                );
              },
              child: const Text("View Statistics"),
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticsPage extends StatelessWidget {
  final Map<int, int> stats;
  final ButtonStyle buttonStyle;

  const StatisticsPage({
    super.key,
    required this.stats,
    required this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        foregroundColor: textColor,
        title: const Text("Statistics"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: stats.entries.map((entry) {
                  return ListTile(
                    title: Text(
                      "Number ${entry.key}",
                      style: statsTextStyle,
                    ),
                    trailing: Text(
                      "${entry.value} times",
                      style: statsTextStyle,
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              style: buttonStyle,
              onPressed: () => Navigator.pop(context),
              child: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
