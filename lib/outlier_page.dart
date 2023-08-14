import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'outlier_bloc.dart';
import 'outlier_state.dart';

class OutlierPage extends StatelessWidget {
  const OutlierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        title: const Text('Liczba odstająca'),
      ),
      body: BlocConsumer<OutlierBloc, OutlierState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is FoundOutlierState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Liczba odstająca: ${state.outlier}',
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Historia zapisu liczb odstających: ${state.outlierHistory}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
