import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>((event, emit) {
      emit(ChangeCounterState(state.data+1));
    });
    on<DecrementEvent>((event, emit) {
      emit(ChangeCounterState(state.data-1));
    });
  }
}
