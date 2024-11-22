class RequestModel {
  final String id;
  final bool status;
  final DateTime requestDate;

  RequestModel({
    required this.id,
    required this.status,
    required this.requestDate,
  });

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      id: map['id'],
      status: map['status'],
      requestDate: DateTime.parse(map['requestDate']),
    );
  }
}