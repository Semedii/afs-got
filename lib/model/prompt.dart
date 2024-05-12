import 'package:cloud_firestore/cloud_firestore.dart';

class Prompt {
  final String id;
  final String question;
  final String response;
  final String userEmail;
  final bool isFavorite;
  final DateTime createdDate;

  Prompt({
    this.id="",
    required this.question,
    required this.response,
    required this.userEmail,
    this.isFavorite=false,
    required this.createdDate,
  });

  factory Prompt.fromFirestore( DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options) {
     final data = snapshot.data();
    return Prompt(
      id: snapshot.id,
      question: data?['question'] ?? '',
      response: data?['response'] ?? '',
      userEmail: data?['userEmail'] ?? '',
      createdDate: (data?['createdDate'] as Timestamp).toDate(),
      isFavorite: data?['isFavorite']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'question': question,
      'response': response,
      'userEmail': userEmail,
      'createdDate': Timestamp.fromDate(createdDate),
      'isFavorite': isFavorite
    };
  }
}
