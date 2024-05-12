import 'package:cloud_firestore/cloud_firestore.dart';

class Prompt {
  final String question;
  final String response;
  final String userEmail;
  final DateTime createdDate;

  Prompt({
    required this.question,
    required this.response,
    required this.userEmail,
    required this.createdDate,
  });

  factory Prompt.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Prompt(
      question: data['question'] ?? '',
      response: data['response'] ?? '',
      userEmail: data['userEmail'] ?? '',
      createdDate: (data['createdDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'question': question,
      'response': response,
      'userEmail': userEmail,
      'createdDate': Timestamp.fromDate(createdDate),
    };
  }
}
