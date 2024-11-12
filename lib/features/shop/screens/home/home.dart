import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:store/features/card/controllers/card_controller.dart';
import 'package:store/features/card/models/card.dart';
import 'package:store/features/card/screens/card_details.dart';
import 'package:store/features/card/screens/store_selection_screen.dart';
import 'package:store/features/shop/screens/home/add_card_form.dart';
import 'dart:developer' as developer;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardController cardController = Get.find<CardController>();
  bool isGridView = false;

  // List of fixed colors for cards
  final List<Color> cardColors = [
    Color(0xFF1E88E5), // Blue
    Color(0xFFD81B60), // Pink
    Color(0xFF43A047), // Green
    Color(0xFFFF6F00), // Orange
    Color(0xFF8E24AA), // Purple
    Color(0xFF00897B), // Teal
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 22, 22),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Saved Cards'),
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.view_carousel : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (context) => StoreSelectionPage(),
                    ),
                  )
                      .then((_) {
                    cardController.fetchUserCards();
                  });
                },
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        developer.log(
            'Building HomeScreen. Cards count: ${cardController.userCards.length}');
        developer.log('Is loading: ${cardController.isLoading.value}');

        if (cardController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (cardController.userCards.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No cards available.'),
                SizedBox(height: 5),
                Text('Tap on the + icon to add a Card'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => cardController.fetchUserCards(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Refresh Cards'),
                  ),
                ),
              ],
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () => cardController.fetchUserCards(),
            child: isGridView
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.586,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    padding: EdgeInsets.all(10),
                    itemCount: cardController.userCards.length,
                    itemBuilder: (context, index) {
                      return CardItem(
                        card: cardController.userCards[index],
                        color: cardColors[index % cardColors.length],
                        isGridView: true,
                      );
                    },
                  )
                : Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return CardItem(
                        card: cardController.userCards[index],
                        color: cardColors[index % cardColors.length],
                        isGridView: false,
                      );
                    },
                    itemCount: cardController.userCards.length,
                    itemWidth: 350,
                    itemHeight: 220,
                    layout: SwiperLayout.STACK,
                    scrollDirection: Axis.vertical,
                  ),
          );
        }
      }),
    );
  }
}

class CardItem extends StatelessWidget {
  final CardModel card;
  final Color color;
  final bool isGridView;

  const CardItem({
    Key? key,
    required this.card,
    required this.color,
    required this.isGridView,
  }) : super(key: key);

  bool _shouldUseDarkText(Color backgroundColor) {
    double luminance = (0.299 * backgroundColor.red +
            0.587 * backgroundColor.green +
            0.114 * backgroundColor.blue) /
        255;
    return luminance > 0.5;
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = card.storeColor ?? color;
    final bool useDarkText = _shouldUseDarkText(backgroundColor);
    final textColor = useDarkText ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CardDetailsPage(card: card),
          ),
        );
      },
      child: Container(
        width: 350,
        height: 220,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            if (isGridView)
              // Only show centered logo in grid view
              Center(
                child: Container(
                  width: 80, // Increased size for better visibility
                  height: 70,
                  child: _buildLogo(),
                ),
              )
            else ...[
              // Regular carousel view layout
              Positioned(
                top: 20,
                left: 20,
                child: Text(
                  card.storeName ?? 'Unknown Store',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Icon(
                  Icons.credit_card,
                  color: textColor.withOpacity(0.8),
                  size: 30,
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: Container(
                  width: 50,
                  height: 40,
                  child: _buildLogo(),
                ),
              ),
              Positioned(
                bottom: 60,
                left: 20,
                child: Text(
                  formatCardNumber(card.cardNumber ?? ''),
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  'VALID THRU',
                  style: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontSize: 10,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 90,
                child: Text(
                  card.expiryDate ?? 'MM/YY',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      child: card.logoPath != null && card.logoPath!.isNotEmpty
          ? Image.asset(
              card.logoPath!,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/logos/cardPocket_logo.png',
                  fit: BoxFit.contain,
                );
              },
            )
          : Image.asset(
              'assets/logos/cardPocket_logo.png',
              fit: BoxFit.contain,
            ),
    );
  }

  String formatCardNumber(String number) {
    if (number.length != 16) return number;
    return number.replaceAllMapped(
      RegExp(r".{4}"),
      (match) => "${match.group(0)} ",
    );
  }
}
