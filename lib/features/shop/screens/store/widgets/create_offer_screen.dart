import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/appbar/appbar.dart';
import 'package:store/features/shop/screens/store/offers_screen.dart';
import 'package:store/features/shop/screens/store/widgets/offer_controller.dart';
import 'package:store/features/shop/screens/store/widgets/offer_model.dart';

class CreateOfferScreen extends StatefulWidget {
  const CreateOfferScreen({super.key});

  @override
  State<CreateOfferScreen> createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends State<CreateOfferScreen> {
  final _formKey = GlobalKey<FormState>();
  final _offerController = Get.put(OfferController());

  final _storeNameController = TextEditingController();
  final _offerTitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _validUntilController = TextEditingController();
  final _discountPercentController = TextEditingController();
  final _couponCodeController = TextEditingController();

  Color _selectedColor = Colors.blue;
  DateTime _selectedDate = DateTime.now();

  final List<Color> _colorOptions = [
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.teal,
    Colors.indigo,
    Colors.pink,
  ];

  // Reusable input decoration
  InputDecoration _getInputDecoration(String label, {String? suffixText}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white),
      floatingLabelStyle: const TextStyle(color: Colors.white),
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      suffixText: suffixText,
      suffixStyle: const TextStyle(color: Colors.white),
    );
  }

  @override
  void dispose() {
    _storeNameController.dispose();
    _offerTitleController.dispose();
    _descriptionController.dispose();
    _validUntilController.dispose();
    _discountPercentController.dispose();
    _couponCodeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _validUntilController.text =
            "${picked.day} ${_getMonth(picked.month)} ${picked.year}";
      });
    }
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newOffer = OfferModel(
        storeName: _storeNameController.text,
        offerTitle: _offerTitleController.text,
        description: _descriptionController.text,
        validUntil: _validUntilController.text,
        discountPercent: _discountPercentController.text,
        couponCode: _couponCodeController.text,
        storeColor: _selectedColor,
      );

      _offerController.addOffer(newOffer);
      Get.back();
      Get.snackbar(
        'Success',
        'Offer created successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(
        title: Text(
          "Create Offer",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(fontSizeDelta: 1.5),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _storeNameController,
                decoration: _getInputDecoration('Store Name'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter store name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _offerTitleController,
                decoration: _getInputDecoration('Offer Title'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter offer title' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: _getInputDecoration('Description'),
                maxLines: 3,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter description' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _validUntilController,
                decoration: _getInputDecoration('Valid Until'),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) => value?.isEmpty ?? true
                    ? 'Please select valid until date'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _discountPercentController,
                decoration:
                    _getInputDecoration('Discount Percentage', suffixText: '%'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true)
                    return 'Please enter discount percentage';
                  final number = int.tryParse(value!);
                  if (number == null || number <= 0 || number > 100) {
                    return 'Please enter a valid percentage (1-100)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _couponCodeController,
                decoration: _getInputDecoration('Coupon Code'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter coupon code' : null,
              ),
              const SizedBox(height: 16),
              const Text(
                'Store Color:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _colorOptions.map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _selectedColor == color
                              ? Colors.white // Changed to white for consistency
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Create Offer',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
