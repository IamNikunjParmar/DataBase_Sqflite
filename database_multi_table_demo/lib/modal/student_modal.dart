class StudentModal {
  int? id;
  String name;
  String email;
  String number;
  String? professorId;

  StudentModal({
    this.id,
    required this.name,
    required this.email,
    required this.number,
    this.professorId,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'number': number,
        'professorId': professorId,
      };

  factory StudentModal.fromMap({required Map<String, dynamic> data}) {
    return StudentModal(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      number: data['number'],
      professorId: data['professorId'],
    );
  }
}
