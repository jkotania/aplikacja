import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/outlier_page.dart';
import 'outlier_bloc.dart';
import 'outlier_event.dart';
import 'outlier_state.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => OutlierBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
          appBarTheme: const AppBarTheme(color: Colors.red),
        ),
        home: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
              BlocListener<OutlierBloc, OutlierState>(
                listener: (context, state) {
                  if (state is FoundOutlierState) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: BlocProvider.of<OutlierBloc>(context),
                          child: const OutlierPage(),
                        ),
                      ),
                    );
                  }
                },
                child: ElevatedButton(
                  child: const Text('Wyszukaj'),
                  onPressed: () {
                    context
                        .read<OutlierBloc>()
                        .add(FindOutlierEvent(controller.text));
                  },
                ),
              )
            ]),
      ),
    );
  }
}
