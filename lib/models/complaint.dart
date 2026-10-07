import 'package:camera/camera.dart';

class Complaint {
  final String title;
  final String description;
  final DateTime submittedAt;
  String status;
  final XFile? image;

  Complaint({
    required this.title,
    required this.description,
    required this.submittedAt,
    this.status = 'Submitted',
    this.image,
  });
}

class ComplaintStore {
  static final List<Complaint> complaints = [];
}
