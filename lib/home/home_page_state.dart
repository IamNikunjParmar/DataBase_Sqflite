part of 'home_page_cubit.dart';

class HomePageState extends Equatable {
  final List userList;
  final bool isLoading;
  final String error;
  final TextEditingController nameController;
  final TextEditingController companyController;
  final TextEditingController ageController;

  const HomePageState({
    required this.nameController,
    required this.companyController,
    required this.ageController,
    this.userList = const [],
    this.error = '',
    this.isLoading = false,
  });

  HomePageState copyWith({
    List? userList,
    bool? isLoading,
    String? error,
    TextEditingController? nameController,
    TextEditingController? companyController,
    TextEditingController? ageController,
  }) {
    return HomePageState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      userList: userList ?? this.userList,
      nameController: nameController ?? this.nameController,
      companyController: companyController ?? this.companyController,
      ageController: ageController ?? this.ageController,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [userList, isLoading, error, nameController, ageController, companyController];
}
