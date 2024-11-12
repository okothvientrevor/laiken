import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/screens/store/widgets/offer_controller.dart';

class OfferSearchBar extends StatelessWidget {
  const OfferSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OfferController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search offers...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: controller.setSearchQuery,
          ),
        ],
      ),
    );
  }
}
