import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class BarcodeScanPage extends StatefulWidget {
  @override
  _BarcodeScanPageState createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  String _scannedCardNumber = 'No card number scanned';

  Future<void> scanBarcode() async {
    try {
      // Start barcode scanning process
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Color for the cancel button
        'Cancel', // Text for the cancel button
        true, // Show the flash icon
        ScanMode.BARCODE, // Scan mode (BARCODE or QR)
      );

      // Check if the scan was successful
      if (barcodeScanRes != '-1') {
        setState(() {
          _scannedCardNumber = barcodeScanRes;
        });
      } else {
        setState(() {
          _scannedCardNumber = 'Scan canceled';
        });
      }
    } catch (e) {
      setState(() {
        _scannedCardNumber = 'Failed to scan the barcode: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Scan Barcode'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              padding: EdgeInsetsDirectional.all(30),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 101, 100, 100),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Number:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _scannedCardNumber,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: scanBarcode,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: const Text('Scan Barcode'),
            ),
          ],
        ),
      ),
    );
  }
}
