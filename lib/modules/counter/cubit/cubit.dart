import 'package:bloc/bloc.dart';
// import 'dart:js';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());
  // CounterCubit cubit = BlocProvider.of(context);
  static CounterCubit get(context) => BlocProvider.of(context);
  int counter = 0;
  void miuns() {
    counter--;
    emit(CounterMiunsState(counter));
  }

  void plus() {
    counter++;
    emit(CounterPlusState(counter));
  }
}
