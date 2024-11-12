import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VAppBar(
        showBackArrow: true,
        title: Text("Add new Address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.user),
                    labelText: "Name",
                    labelStyle: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.mobile),
                    labelText: "Phone Number",
                    labelStyle: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.building_3),
                          labelText: "Street",
                          labelStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ),
                  const SizedBox(
                    width: VSizes.inputFieldRadius,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.home5),
                          labelText: "Address",
                          labelStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.building),
                          labelText: "City",
                          labelStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ),
                  const SizedBox(
                    width: VSizes.inputFieldRadius,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.activity),
                          labelText: "State",
                          labelStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.global),
                    labelText: "Country",
                    labelStyle: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(
                height: VSizes.defaultSpace,
              ),
              SizedBox(
                width: double.infinity,
                child:
                    ElevatedButton(onPressed: () {}, child: const Text("Save")),
              )
            ],
          )),
        ),
      ),
    );
  }
}
