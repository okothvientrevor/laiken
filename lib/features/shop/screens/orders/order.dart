import 'package:flutter/material.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/features/shop/screens/orders/widgets/orders_list.dart';
import 'package:store/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(
        title: Text(
          "My Orders",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(VSizes.defaultSpace),
        child: VOrderListItems(),
      ),
    );
  }
}
