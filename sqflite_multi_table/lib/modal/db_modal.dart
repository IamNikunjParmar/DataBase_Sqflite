class EmpModal {
  int id;
  String name;
  String companyName;

  EmpModal({
    required this.id,
    required this.name,
    required this.companyName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'companyName': companyName,
    };
  }

  factory EmpModal.fromMap({required Map<String, dynamic> data}) {
    return EmpModal(
      id: data['id'],
      name: data['name'],
      companyName: data['companyName'],
    );
  }
}
