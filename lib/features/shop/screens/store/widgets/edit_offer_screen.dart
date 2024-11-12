import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/screens/store/widgets/offer_controller.dart';
import 'package:store/features/shop/screens/store/widgets/offer_model.dart';

class EditOfferScreen extends StatefulWidget {
  final OfferModel offer;

  const EditOfferScreen({Key? key, required this.offer}) : super(key: key);

  @override
  State<EditOfferScreen> createState() => _EditOfferScreenState();
}

class _EditOfferScreenState extends State<EditOfferScreen> {
  final _formKey = GlobalKey<FormState>();
  final _offerController = Get.find<OfferController>();
  late final TextEditingController _storeNameController;
  late final TextEditingController _offerTitleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _validUntilController;
  late final TextEditingController _discountPercentController;
  late final TextEditingController _couponCodeController;
  late Color _selectedColor;
  late DateTime _selectedDate;

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

  @override
  void initState() {
    super.initState();
    _storeNameController = TextEditingController(text: widget.offer.storeName);
    _offerTitleController =
        TextEditingController(text: widget.offer.offerTitle);
    _descriptionController =
        TextEditingController(text: widget.offer.description);
    _validUntilController =
        TextEditingController(text: widget.offer.validUntil);
    _discountPercentController =
        TextEditingController(text: widget.offer.discountPercent);
    _couponCodeController =
        TextEditingController(text: widget.offer.couponCode);
    _selectedColor = widget.offer.storeColor;
    _selectedDate = widget.offer.expiryDate;
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
      final updatedOffer = widget.offer.copyWith(
        storeName: _storeNameController.text,
        offerTitle: _offerTitleController.text,
        description: _descriptionController.text,
        validUntil: _validUntilController.text,
        discountPercent: _discountPercentController.text,
        couponCode: _couponCodeController.text,
        storeColor: _selectedColor,
        expiryDate: _selectedDate,
      );

      _offerController.updateOffer(updatedOffer);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Offer",
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
                decoration: const InputDecoration(
                  labelText: 'Store Name',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter store name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _offerTitleController,
                decoration: const InputDecoration(
                  labelText: 'Offer Title',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter offer title' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter description' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _validUntilController,
                decoration: const InputDecoration(
                  labelText: 'Valid Until',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) => value?.isEmpty ?? true
                    ? 'Please select valid until date'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _discountPercentController,
                decoration: const InputDecoration(
                  labelText: 'Discount Percentage',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  suffixText: '%',
                ),
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
                decoration: const InputDecoration(
                  labelText: 'Coupon Code',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
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
                              ? Colors.white
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
                    'Update Offer',
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
