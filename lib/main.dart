import 'package:flutter/material.dart';

int findOutlier(List<int> numbers) {
  int oddCount = 0;

  for (int number in numbers) {
    if (number % 2 == 1) {
      oddCount++;
    }
  }

  if (oddCount == 1) {
    return numbers.firstWhere((number) => number % 2 == 1);
  } else {
    return numbers.firstWhere((number) => number % 2 == 0);
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(color: Colors.red)),
    home: MyApp(),
  ));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final List<int> outlierHistory = [];
  final List<String> inputHistory = [];

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Znajdź liczbę odstającą'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 400,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Wpisz liczby po przecinku',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Wyszukaj'),
                onPressed: () {
                  try {
                    List<String> numbersString = (controller.text).split(',');

                    List<int> numbers = numbersString
                        .map((number) => int.parse(number))
                        .toList();
                    int outlier = findOutlier(numbers);

                    outlierHistory.add(outlier);
                    inputHistory.add(controller.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OutlierPage(
                          outlier: outlier,
                          outlierHistory: outlierHistory,
                          key: UniqueKey(),
                        ),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Błąd: ${e.toString()}'),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OutlierPage extends StatelessWidget {
  final int outlier;
  final List<int> outlierHistory;

  const OutlierPage({
    required Key key,
    required this.outlier,
    required this.outlierHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liczba odstająca'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Liczba odstająca: $outlier',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Historia zapisu liczb odstających: $outlierHistory',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
