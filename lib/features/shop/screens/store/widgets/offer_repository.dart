import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;

import 'package:store/features/shop/screens/store/widgets/offer_model.dart';

class OfferRepository {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> addOffer(OfferModel offer) async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw 'User not authenticated';

      final docRef = _db.collection('offers').doc();
      await docRef.set({
        ...offer.toJson(),
        'userId': user.uid,
      });
    } catch (e) {
      developer.log('Error adding offer: $e');
      rethrow;
    }
  }

  Future<void> updateOffer(OfferModel offer) async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw 'User not authenticated';
      if (offer.id == null) throw 'Offer ID is required for update';

      final offerDoc = await _db.collection('offers').doc(offer.id).get();
      if (!offerDoc.exists) throw 'Offer not found';
      if (offerDoc.data()?['userId'] != user.uid) {
        throw 'You do not have permission to update this offer';
      }

      await _db.collection('offers').doc(offer.id).update(offer.toJson());
    } catch (e) {
      developer.log('Error updating offer: $e');
      rethrow;
    }
  }

  Future<List<OfferModel>> getUserOffers({
    String? searchQuery,
    bool activeOnly = false,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw 'User not authenticated';

      Query query =
          _db.collection('offers').where('userId', isEqualTo: user.uid);

      if (activeOnly) {
        query = query.where('isActive', isEqualTo: true).where('expiryDate',
            isGreaterThan: DateTime.now().toIso8601String());
      }

      final snapshot = await query.get();

      List<OfferModel> offers = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return OfferModel.fromJson(data);
      }).toList();

      if (searchQuery != null && searchQuery.isNotEmpty) {
        searchQuery = searchQuery.toLowerCase();
        offers = offers.where((offer) {
          return offer.storeName.toLowerCase().contains(searchQuery!) ||
              offer.offerTitle.toLowerCase().contains(searchQuery) ||
              offer.description.toLowerCase().contains(searchQuery) ||
              offer.couponCode.toLowerCase().contains(searchQuery);
        }).toList();
      }

      return offers;
    } catch (e) {
      developer.log('Error fetching offers: $e');
      rethrow;
    }
  }

  Future<void> checkAndUpdateExpiredOffers() async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw 'User not authenticated';

      final snapshot = await _db
          .collection('offers')
          .where('userId', isEqualTo: user.uid)
          .where('isActive', isEqualTo: true)
          .get();

      final batch = _db.batch();
      final now = DateTime.now().toIso8601String();

      for (var doc in snapshot.docs) {
        final expiryDate = doc.data()['expiryDate'] as String;
        if (expiryDate.compareTo(now) < 0) {
          batch.update(doc.reference, {'isActive': false});
        }
      }

      await batch.commit();
    } catch (e) {
      developer.log('Error checking expired offers: $e');
      rethrow;
    }
  }
}
