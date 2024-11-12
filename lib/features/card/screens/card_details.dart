// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store/features/card/controllers/card_controller.dart';
import 'package:store/features/card/models/card.dart';
import 'package:store/features/card/screens/card_photo_uploads.dart';
import 'package:store/features/card/screens/edit_card_page.dart';
import 'package:store/navigation_menu.dart';

class CardDetailsPage extends StatelessWidget {
  final CardController cardController = Get.find<CardController>();
  final CardModel card;

  CardDetailsPage({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color randomColor =
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.5);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('${card.storeName}'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              _showBottomSheet(context, card);
            },
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white, // White border
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(
                      20), // Optional: To make the edges rounded
                ),
                child: Icon(Icons.more_horiz)),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: card.storeColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: [
                        Container(width: 50, height: 50, child: _buildLogo()),
                        Spacer(),
                        Container(
                          width: 280,
                          height: 200,
                          padding:
                              EdgeInsets.only(top: 30, left: 30, right: 30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              BarcodeWidget(
                                barcode: Barcode.code128(),
                                data: card.cardNumber ?? 'Unknown',
                                width: 280,
                                height: 120,
                                drawText: false,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${card.cardNumber}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _showNotesBottomSheet(context),
                        child: Row(
                          children: [
                            Icon(
                              Icons.event_note_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Notes',
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        indent: 36,
                        color: Color.fromARGB(255, 72, 72, 72),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardDualImageUpload(card: card))),
                        child: Row(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Pictures',
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Text('CVV: ${card.cvv ?? 'N/A'}', style: TextStyle(fontSize: 18)),
              // if (card.notes?.isNotEmpty == true) ...[
              //   SizedBox(height: 16),
              //   Text('Notes:',
              //       style:
              //           TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              //   SizedBox(height: 8),
              //   Text(card.notes!, style: TextStyle(fontSize: 16)),
              // ],
            ],
          ),
        ),
      ),
    );
  }

  void _deleteCard(BuildContext context) {
    final cardController = Get.find<CardController>();
    if (card.id != null) {
      cardController.deleteCard(card.id!).then((_) {
        // Use Get.off() to replace the current route
        Get.off(() => NavigationMenu());
      }).catchError((error) {
        // Show an error message if deletion fails
        Get.snackbar(
          'Error',
          'Failed to delete card: $error',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } else {
      Get.snackbar(
        'Error',
        'Cannot delete card: Invalid card ID',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void _showBottomSheet(BuildContext context, CardModel card) {
    final CardController cardController = Get.find<CardController>();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.edit, color: Colors.white),
                title: Text('Edit Card', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop();
                  _showEditCardDialog(context, card, cardController);
                },
              ),
              Divider(indent: 40),
              ListTile(
                leading: Icon(Icons.share, color: Colors.white),
                title:
                    Text('Share Card', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop();
                  _shareCard(card);
                },
              ),
              Divider(indent: 40),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text('Delete Card', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.of(context).pop();
                  _showDeleteConfirmation(context, card.id, cardController);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditCardDialog(
      BuildContext context, CardModel card, CardController cardController) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            EditCardPage(card: card, cardController: cardController),
      ),
    );
  }

  void _shareCard(CardModel card) {
    final String shareText = 'Card Details:\n'
        'Holder: ${card.storeName}\n'
        'Number: ${card.cardNumber}\n'
        'Expiry: ${card.expiryDate}';

    Share.share(shareText, subject: 'My Card Details');
  }

  void _showDeleteConfirmation(
      BuildContext context, String cardId, CardController cardController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Delete Card',
            style: TextStyle(color: Colors.black),
          ),
          content: Text(
            'Are you sure you want to delete this card?',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
              onPressed: () {
                cardController.deleteCard(cardId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showNotesBottomSheet(BuildContext context) {
    final TextEditingController _notesController =
        TextEditingController(text: card.notes);
    final RxBool _isLoading = false.obs;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 5,
                width: 40,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _notesController,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: 'Enter your notes here',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(() => ElevatedButton(
                      child: _isLoading.value
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Text('Save'),
                      onPressed: _isLoading.value
                          ? null
                          : () async {
                              _isLoading.value = true;
                              final updatedCard =
                                  card.copyWith(notes: _notesController.text);
                              await cardController.updateCard(updatedCard);
                              _isLoading.value = false;
                              Navigator.of(context).pop();

                              // Show updated notes
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     content: Text('Notes updated successfully'),
                              //     duration: Duration(seconds: 2),
                              //   ),
                              // );
                            },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 100,
      height: 80,
      child: card.logoPath != null && card.logoPath!.isNotEmpty
          ? Image.asset(
              card.logoPath!,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                // If logo loading fails, show default logo
                return Image.asset(
                  'assets/logos/cardPocket_logo.png',
                  fit: BoxFit.contain,
                );
              },
            )
          : Text(
              card.storeName?.isNotEmpty == true
                  ? card.storeName![0].toUpperCase()
                  : '?',
              style: TextStyle(fontSize: 35),
            ),
    );
  }
}
