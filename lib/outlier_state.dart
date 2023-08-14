abstract class OutlierState {}

class InitialState extends OutlierState {}

class FoundOutlierState extends OutlierState {
  final int outlier;
  final List<int> outlierHistory;
  FoundOutlierState(this.outlier, this.outlierHistory);
}

class ErrorState extends OutlierState {
  final String message;
  ErrorState(this.message);
}
