part of 'details_view.dart';

class DetailsEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class SetProductDetails extends DetailsEvent{
  final String name;

  SetProductDetails({
    required this.name,
  });
}