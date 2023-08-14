abstract class OutlierEvent {}

class FindOutlierEvent extends OutlierEvent {
  final String numbers;
  FindOutlierEvent(this.numbers);
}
