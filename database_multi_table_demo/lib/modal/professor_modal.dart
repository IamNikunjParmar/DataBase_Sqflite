class ProfessorModal {
  int? id;
  String name;
  String subject;
  String number;

  ProfessorModal({
    this.id,
    required this.name,
    required this.subject,
    required this.number,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'subject': subject,
        'number': number,
      };

  factory ProfessorModal.fromMap({required Map<String, dynamic> data}) {
    return ProfessorModal(
      id: data['id'],
      name: data['name'],
      subject: data['subject'],
      number: data['number'],
    );
  }
}
