part of 'counter_bloc.dart';


abstract class CounterState {
  int data;
  CounterState({this.data=1});
}

class CounterInitial extends CounterState {}

class ChangeCounterState extends CounterState{
  ChangeCounterState(int val):super(data: val);
}