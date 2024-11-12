import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store/features/card/models/card.dart';
import 'package:store/utils/exceptions/firebase_auth_exception.dart';
import 'dart:developer' as developer;

class CardRepository {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> addCard(CardModel card) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw 'User not authenticated';
      }

      developer.log('Adding new card to Firestore for user: ${user.uid}');
      await _db.collection('cards').doc(card.id).set({
        ...card.toJson(),
        'userId': user.uid,
      });
      developer.log('Card added successfully with ID: ${card.id}');
    } catch (e) {
      developer.log('Error adding card: $e');
      rethrow;
    }
  }

  Future<List<CardModel>> getUserCards() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw 'User not authenticated';
      }

      developer.log('Fetching cards for user: ${user.uid}');
      final snapshot = await _db
          .collection('cards')
          .where('userId', isEqualTo: user.uid)
          .get();
      developer.log(
          'Firestore query completed. Documents count: ${snapshot.docs.length}');

      if (snapshot.docs.isEmpty) {
        developer.log('No cards found for this user.');
        return [];
      }

      List<CardModel> cards = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        data['id'] = doc.id; // Ensure the ID is included
        return CardModel.fromJson(data);
      }).toList();

      developer.log('Successfully parsed ${cards.length} cards for the user');
      return cards;
    } on FirebaseException catch (e) {
      developer.log('FirebaseException in getUserCards: ${e.code}');
      throw VFirebaseException(e.code).message;
    } catch (e) {
      developer.log('Unexpected error in getUserCards: $e');
      throw 'Something went wrong. Please try again. Error: $e';
    }
  }

  Future<void> deleteCard(String cardId) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw 'User not authenticated';
      }

      developer.log('Deleting card with ID: $cardId for user: ${user.uid}');

      // First, fetch the card to ensure it belongs to the current user
      final cardDoc = await _db.collection('cards').doc(cardId).get();

      if (!cardDoc.exists) {
        throw 'Card not found';
      }

      if (cardDoc.data()?['userId'] != user.uid) {
        throw 'You do not have permission to delete this card';
      }

      // If checks pass, delete the card
      await _db.collection('cards').doc(cardId).delete();
      developer.log('Card deleted successfully');
    } on FirebaseException catch (e) {
      developer.log('FirebaseException in deleteCard: ${e.code}');
      throw VFirebaseException(e.code).message;
    } catch (e) {
      developer.log('Error deleting card: $e');
      rethrow;
    }
  }

  Future<void> updateCard(CardModel card) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw 'User not authenticated';
      }

      developer.log('Updating card with ID: ${card.id} for user: ${user.uid}');

      // First, fetch the card to ensure it belongs to the current user
      final cardDoc = await _db.collection('cards').doc(card.id).get();

      if (!cardDoc.exists) {
        throw 'Card not found';
      }

      if (cardDoc.data()?['userId'] != user.uid) {
        throw 'You do not have permission to update this card';
      }

      // If checks pass, update the card
      await _db.collection('cards').doc(card.id).update(card.toJson());
      developer.log('Card updated successfully');
    } on FirebaseException catch (e) {
      developer.log('FirebaseException in updateCard: ${e.code}');
      throw VFirebaseException(e.code).message;
    } catch (e) {
      developer.log('Error updating card: $e');
      rethrow;
    }
  }
}
