import 'package:bloc/bloc.dart';
import 'package:block_strucher/switch/switch_event.dart';
import 'package:block_strucher/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableButton>(_enableButton);
  }

  void _enableButton(EnableButton event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}
