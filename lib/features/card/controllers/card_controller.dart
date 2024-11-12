import 'package:get/get.dart';
import 'package:store/features/card/controllers/card_repository.dart';
import 'package:store/features/card/models/card.dart';
import 'package:store/utils/constants/loaders.dart';
import 'dart:developer' as developer;

class CardController extends GetxController {
  static CardController get instance => Get.find();
  final isLoading = false.obs;
  final _cardRepository = Get.put(CardRepository());
  RxList<CardModel> userCards = <CardModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    developer.log('CardController initialized');
    fetchUserCards();
  }

  Future<void> fetchUserCards() async {
    try {
      isLoading.value = true;
      developer.log('Fetching user cards...');
      final response = await _cardRepository.getUserCards();
      developer.log('Fetched user cards: ${response.length}');
      userCards.assignAll(response);
      developer.log('userCards count: ${userCards.length}');
    } catch (e) {
      developer.log('Error in fetchUserCards: $e');
      userCards.clear(); // Clear any existing cards
      if (e.toString().contains('User not authenticated')) {
        developer.log('User is not authenticated');
      } else {
        VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addCard(CardModel card) async {
    try {
      isLoading.value = true;
      developer.log('Adding new card...');
      await _cardRepository.addCard(card);
      developer.log('Card added, refreshing list...');
      await fetchUserCards();
    } catch (e) {
      developer.log('Error in addCard: $e');
      VLoaders.errorSnackBar(
          title: 'Error', message: 'Failed to add card: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteCard(String cardId) async {
    try {
      isLoading.value = true;
      developer.log('Deleting card...');
      await _cardRepository.deleteCard(cardId);
      developer.log('Card deleted, refreshing list...');
      await fetchUserCards();
      VLoaders.successSnackBar(
          title: 'Success', message: 'Card deleted successfully');
    } catch (e) {
      developer.log('Error in deleteCard: $e');
      VLoaders.errorSnackBar(
          title: 'Error', message: 'Failed to delete card: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateCard(CardModel card) async {
    try {
      isLoading.value = true;
      developer.log('Updating card...');
      await _cardRepository.updateCard(card);
      developer.log('Card updated, refreshing list...');
      await fetchUserCards();
      VLoaders.successSnackBar(
          title: 'Success', message: 'Card updated successfully');
    } catch (e) {
      developer.log('Error in updateCard: $e');
      VLoaders.errorSnackBar(
          title: 'Error', message: 'Failed to update card: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
