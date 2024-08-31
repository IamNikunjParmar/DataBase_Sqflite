part of 'details_view.dart';

class DetailsState extends Equatable{
  final String name;

  const DetailsState({
    required this.name,
  });

  @override
  List<Object?> get props => [name];

  DetailsState copyWith({
    String? name,
  }) {
    return DetailsState(
      name: name ?? this.name,
    );
  }
}