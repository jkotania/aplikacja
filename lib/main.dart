import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'outlier_bloc.dart';
import 'myapp.dart';

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
