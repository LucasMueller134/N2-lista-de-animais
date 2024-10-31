import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pet.dart';

class FirestoreService {
  final CollectionReference _petsCollection =
      FirebaseFirestore.instance.collection('pets');

  Future<void> addPet(Pet pet) {
    return _petsCollection.add(pet.toMap());
  }

  Future<void> updatePet(Pet pet) {
    return _petsCollection.doc(pet.id).update(pet.toMap());
  }

  Future<void> deletePet(String petId) {
    return _petsCollection.doc(petId).delete();
  }

  Stream<List<Pet>> getPets() {
    return _petsCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Pet.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }
}
