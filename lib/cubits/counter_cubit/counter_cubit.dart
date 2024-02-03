import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  incrementCounter(int counter) {
    counter = counter + 1;
    emit(CounterUpdate(count: counter));
  }

  decrementCounter(int counter) {
    if (counter > 1) {
      counter = counter - 1;
    }
    emit(CounterUpdate(count: counter));
  }
}
