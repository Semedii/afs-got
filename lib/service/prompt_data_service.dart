import 'package:afs_gpt/model/prompt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromptDataService {
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

  Future<List<Prompt?>> fetchHistory(String email) async {
    try {
      final collectionRef = db.collection("prompts").withConverter(
            fromFirestore: Prompt.fromFirestore,
            toFirestore: (prompt, _) => prompt.toFirestore(),
          );
      final querySnapshot = await collectionRef
          .where("userEmail", isEqualTo: email)
          .orderBy("createdDate", descending: true)
          .get();
      List<Prompt> prompts =
          querySnapshot.docs.map((doc) => doc.data()).toList();
      return prompts;
    } catch (e) {
      print("Error fetching history: $e");
      return [];
    }
  }

  Future<List<Prompt?>> fetchFavorites(String email) async {
    try {
      final collectionRef = db.collection("prompts").withConverter(
            fromFirestore: Prompt.fromFirestore,
            toFirestore: (prompt, _) => prompt.toFirestore(),
          );
      final querySnapshot = await collectionRef
          .where("userEmail", isEqualTo: email)
          .where("isFavorite", isEqualTo: true)
          .orderBy("createdDate", descending: true)
          .get();
      List<Prompt> prompts =
          querySnapshot.docs.map((doc) => doc.data()).toList();
      return prompts;
    } catch (e) {
      print("Error fetching favorites: $e");
      return [];
    }
  }

  Future<void> updateIsFavorite(
      {required String id, required bool isFavorite}) async {
    final isFavData = {"isFavorite": isFavorite};
    db.collection('prompts').doc(id).update(isFavData);
  }
}
