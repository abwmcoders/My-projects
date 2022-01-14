import 'package:bloc/bloc.dart';

enum CounterEvents {increement, decreement}

class CounterBloc extends Bloc<CounterEvents, int>{
  CounterBloc(int initialState) : super(initialState);


  @override
  Stream<int> mapEventToState(CounterEvents event) async* {
    //
    switch(event){
      case CounterEvents.increement:
        yield state + 1;
        break;
      case CounterEvents.decreement:
        yield state - 1;
        break;
    }
  }

}