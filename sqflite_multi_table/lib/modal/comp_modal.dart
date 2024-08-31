class CmpModal {
  int id;
  String name, colCompanyName2;

  CmpModal({required this.id, required this.name, required this.colCompanyName2});

  factory CmpModal.fromMap({required Map data}) => CmpModal(
        id: data['id'],
        name: data['name'],
        colCompanyName2: data['name'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'companyName': colCompanyName2,
      };
}
