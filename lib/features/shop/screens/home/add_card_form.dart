import 'package:flutter/material.dart';
import 'package:store/features/card/controllers/card_repository.dart';
import 'package:store/features/card/models/card.dart';
import 'package:store/features/card/screens/card_details.dart';

class CardFormPage extends StatefulWidget {
  final String storeName;
  final Color storeColor;
  final String logoPath;

  const CardFormPage({
    Key? key,
    required this.storeName,
    required this.storeColor,
    required this.logoPath,
  }) : super(key: key);

  @override
  _CardFormPageState createState() => _CardFormPageState();
}

class _CardFormPageState extends State<CardFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _storeNameController;
  final TextEditingController _cardNumberController = TextEditingController();
  final CardRepository _cardRepository = CardRepository();

  @override
  void initState() {
    super.initState();
    // For "Other card", initialize with an empty string
    _storeNameController = TextEditingController(
        text: widget.storeName == 'Other card' ? '' : widget.storeName);
  }

  @override
  void dispose() {
    _storeNameController.dispose();
    _cardNumberController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      CardModel card = CardModel(
        // Use the store name from the controller for "Other card"
        storeName: _storeNameController.text,
        cardNumber: _cardNumberController.text,
        expiryDate: '',
        notes: '',
        storeColor: widget.storeColor,
        // Set logoPath to null for "Other card"
        logoPath: widget.storeName == 'Other card' ? null : widget.logoPath,
      );

      try {
        await _cardRepository.addCard(card);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Card added successfully!')),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => CardDetailsPage(card: card),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add card: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isOtherCard = widget.storeName == 'Other card';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Card',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Only show logo container for non-"Other card" cards
                  if (!isOtherCard)
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: widget.storeColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          widget.logoPath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  if (!isOtherCard) SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _storeNameController,
                      decoration: InputDecoration(
                        labelText: 'Store Name',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      // Add this new property to make the field read-only for non-"Other card" cards
                      readOnly: widget.storeName != 'Other card',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a store name' : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a card number' : null,
              ),
              SizedBox(height: 32),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Submit Card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
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
