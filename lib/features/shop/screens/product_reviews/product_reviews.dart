import 'package:flutter/material.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:store/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: const VAppBar(
        title: Text("Reviews & Ratings"),
        showBackArrow: true,
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use"),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),

              // Overall product ratings
              const VOverallProductRating(),
              const VRatingBarIndicator(
                rating: 3.5,
              ),
              Text(
                "12,611",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),

              // User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
