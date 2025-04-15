import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {

  CounterCubit():super(CounterInitial());

  int counter=0;



  void increment(){
    counter++;
    emit(Increment());
  }

  void decrement(){
    counter--;
    emit(Decrement());

  }




}


