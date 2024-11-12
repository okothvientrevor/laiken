import 'package:flutter/material.dart';
import 'package:store/features/shop/screens/product_reviews/widgets/progress_indicator_and_ratings.dart';

class VOverallProductRating extends StatelessWidget {
  const VOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "4.8",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              VRatingProgressIndicator(
                text: "5",
                value: 1.0,
              ),
              VRatingProgressIndicator(
                text: "4",
                value: 0.8,
              ),
              VRatingProgressIndicator(
                text: "3",
                value: 0.6,
              ),
              VRatingProgressIndicator(
                text: "2",
                value: 0.4,
              ),
              VRatingProgressIndicator(
                text: "1",
                value: 0.2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
