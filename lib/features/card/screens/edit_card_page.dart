import 'package:flutter/material.dart';
import 'package:store/features/card/controllers/card_controller.dart';
import 'package:store/features/card/models/card.dart';
import 'package:store/features/card/screens/card_details.dart';
import 'package:store/navigation_menu.dart';

class EditCardPage extends StatefulWidget {
  final CardModel card;
  final CardController cardController;

  EditCardPage({Key? key, required this.card, required this.cardController})
      : super(key: key);

  @override
  _EditCardPageState createState() => _EditCardPageState();
}

class _EditCardPageState extends State<EditCardPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _storeNameController;
  late TextEditingController _cardNumberController;
  late TextEditingController _expiryDateController;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _storeNameController = TextEditingController(text: widget.card.storeName);
    _cardNumberController = TextEditingController(text: widget.card.cardNumber);
    _expiryDateController = TextEditingController(text: widget.card.expiryDate);
    _notesController = TextEditingController(text: widget.card.notes);
  }

  @override
  void dispose() {
    _storeNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final updatedCard = widget.card.copyWith(
        storeName: _storeNameController.text,
        cardNumber: _cardNumberController.text,
        expiryDate: _expiryDateController.text,
        notes: _notesController.text,
      );
      widget.cardController.updateCard(updatedCard);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => NavigationMenu(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Card'),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Store Name'),
                TextFormField(
                  controller: _storeNameController,
                  decoration: InputDecoration(),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a store name' : null,
                ),
                SizedBox(height: 20),
                Text('Card Number'),
                TextFormField(
                  controller: _cardNumberController,
                  decoration: InputDecoration(),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a card number' : null,
                ),
                SizedBox(height: 20),
                // Text('Expiry Date'),
                // TextFormField(
                //   controller: _expiryDateController,
                //   decoration: InputDecoration(),
                //   validator: (value) =>
                //       value!.isEmpty ? 'Please enter an expiry date' : null,
                // ),
                SizedBox(height: 20),
                Text('Notes'),
                TextFormField(
                  controller: _notesController,
                  decoration: InputDecoration(),
                  maxLines: 3,
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Update Card'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
