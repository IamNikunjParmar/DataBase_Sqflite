import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EnableButton extends SwitchEvent {}
