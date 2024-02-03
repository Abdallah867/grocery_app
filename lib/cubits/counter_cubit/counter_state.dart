part of 'counter_cubit.dart';

 class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterLoading extends CounterState {}

final class CounterUpdate extends CounterState {
  final int count;

  CounterUpdate({required this.count});
}

