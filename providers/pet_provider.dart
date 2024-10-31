import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../services/firestore_service.dart';

class PetProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  Stream<List<Pet>> get pets => _firestoreService.getPets();

  Future<void> addPet(Pet pet) async {
    await _firestoreService.addPet(pet);
  }

  Future<void> updatePet(Pet pet) async {
    await _firestoreService.updatePet(pet);
  }

  Future<void> deletePet(String petId) async {
    await _firestoreService.deletePet(petId);
  }
}
