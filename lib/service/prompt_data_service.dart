import 'package:afs_gpt/model/prompt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromptDataService{
    final FirebaseFirestore db = FirebaseFirestore.instance;
  Future<void> savePrompt(Prompt prompt) async {
    try {
      final docRef = db
          .collection("prompts")
          .withConverter(
            fromFirestore: Prompt.fromFirestore,
            toFirestore: (Prompt prompt, options) => prompt.toFirestore(),
          )
          .doc();
      await docRef.set(prompt);
    } catch (e) {
      print("Error fetching products: $e");
    }
  }
}