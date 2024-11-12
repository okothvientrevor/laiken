import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/screens/store/widgets/offer_model.dart';
import 'package:store/features/shop/screens/store/widgets/offer_repository.dart';

class OfferController extends GetxController {
  final OfferRepository _offerRepository = OfferRepository();
  RxList<OfferModel> offers = <OfferModel>[].obs;
  RxString searchQuery = ''.obs;
  RxBool showActiveOnly = true.obs;
  RxBool isLoading = false.obs;
  Timer? _expiryCheckTimer;

  @override
  void onInit() {
    super.onInit();
    loadOffers();
    // Set up periodic check for expired offers
    _setupExpiryCheck();
  }

  void _setupExpiryCheck() {
    // Check immediately when app starts
    checkExpiredOffers();

    // Then check every hour
    _expiryCheckTimer = Timer.periodic(
      const Duration(hours: 1),
      (_) => checkExpiredOffers(),
    );
  }

  @override
  void onClose() {
    _expiryCheckTimer?.cancel();
    super.onClose();
  }

  Future<void> loadOffers() async {
    try {
      isLoading.value = true;
      final userOffers = await _offerRepository.getUserOffers(
        searchQuery: searchQuery.value,
        activeOnly: showActiveOnly.value,
      );
      offers.value = userOffers;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load offers: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addOffer(OfferModel offer) async {
    try {
      await _offerRepository.addOffer(offer);
      await loadOffers();
    } catch (e) {
      Get.snackbar('Error', 'Failed to create offer: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> updateOffer(OfferModel offer) async {
    try {
      await _offerRepository.updateOffer(offer);
      await loadOffers();
    } catch (e) {
      Get.snackbar('Error', 'Failed to update offer: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> checkExpiredOffers() async {
    try {
      await _offerRepository.checkAndUpdateExpiredOffers();
      await loadOffers();
    } catch (e) {
      print('Error checking expired offers: $e');
    }
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
    loadOffers();
  }

  void toggleActiveOnly() {
    showActiveOnly.value = !showActiveOnly.value;
    loadOffers();
  }

  List<OfferModel> get filteredOffers {
    return offers.where((offer) {
      final matchesSearch = offer.offerTitle
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()) ||
          offer.storeName
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase());

      if (showActiveOnly.value) {
        // Add your logic for checking if an offer is active
        return matchesSearch; // && offer.isActive
      }
      return matchesSearch;
    }).toList();
  }
}
