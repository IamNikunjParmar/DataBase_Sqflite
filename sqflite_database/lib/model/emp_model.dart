class EmployeeModel {
  int id;
  String name;
  int age;

  EmployeeModel({required this.id, required this.name, required this.age});

  factory EmployeeModel.fromMap({required Map data}) => EmployeeModel(
        id: data['id'],
        name: data['name'],
        age: data['age'],
      );
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'age': age,
      };
}
