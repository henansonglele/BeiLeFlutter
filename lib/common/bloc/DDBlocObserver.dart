
import 'package:bloc/bloc.dart';

class DDBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print("${bloc.runtimeType} $bloc onEvent ==> $event");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("${bloc.runtimeType} $bloc onTransition ==> \n"
        "receive event ${transition.event} \n"
        "map to state ${transition.nextState} \n"
        "current state is ${transition.currentState}\n");
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stacktrace) {
    super.onError(cubit, error, stacktrace);
    print("${cubit.runtimeType} $cubit  onError ==> $error");
    print(stacktrace);
  }

  @override
  void onClose(Cubit cubit) {
    super.onClose(cubit);
    print("${cubit.runtimeType} $cubit onClose");
  }

  @override
  void onChange(Cubit cubit, Change change) {
    super.onChange(cubit, change);
    print("${cubit.runtimeType} $cubit onChange from ${change.currentState} to ${change.nextState}");
  }

  @override
  void onCreate(Cubit cubit) {
    super.onCreate(cubit);
    print("${cubit.runtimeType} $cubit onCreate");
  }
}
