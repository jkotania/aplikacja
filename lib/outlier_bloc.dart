import 'package:flutter_bloc/flutter_bloc.dart';
import 'outlier_event.dart';
import 'outlier_state.dart';

class OutlierBloc extends Bloc<OutlierEvent, OutlierState> {
  final List<int> outlierHistory = [];

  OutlierBloc() : super(InitialState()) {
    on<FindOutlierEvent>((event, emit) async {
      try {
        List<String> numbersString = event.numbers.split(',');
        List<int> numbers =
            numbersString.map((number) => int.parse(number)).toList();
        int outlier = findOutlier(numbers);
        outlierHistory.add(outlier);
        emit(FoundOutlierState(outlier, outlierHistory));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }

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
}
