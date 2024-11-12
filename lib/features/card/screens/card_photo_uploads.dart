import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:store/features/card/controllers/card_controller.dart';
import 'package:store/features/card/models/card.dart';
import 'package:store/utils/constants/loaders.dart';

class CardDualImageUpload extends StatefulWidget {
  final CardModel card;

  const CardDualImageUpload({Key? key, required this.card}) : super(key: key);

  @override
  State<CardDualImageUpload> createState() => _CardDualImageUploadState();
}

class _CardDualImageUploadState extends State<CardDualImageUpload> {
  final CardController cardController = CardController.instance;
  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final PageController _pageController = PageController();

  int _currentPage = 0;
  bool _isUploading = false;
  File? _tempImageFile;
  String _uploadingSide = '';
  late CardModel _currentCard;

  @override
  void initState() {
    super.initState();
    _currentCard = widget.card;
  }

  Future<String?> _uploadSingleImage(String imagePath, String side) async {
    try {
      final storageRef = _storage.ref().child(
          'card_images/${_currentCard.id}_${side}_${DateTime.now().millisecondsSinceEpoch}.jpg');

      final uploadTask = await storageRef.putFile(
        File(imagePath),
        SettableMetadata(contentType: 'image/jpeg'),
      );

      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Failed to upload $side image: $e');
    }
  }

  Future<void> _showImageSourceDialog(String side) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Select Image Source',
            style: TextStyle(color: Colors.black),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickAndUploadImage(side, ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickAndUploadImage(side, ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickAndUploadImage(String side, ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image == null) return;

      setState(() {
        _tempImageFile = File(image.path);
        _isUploading = true;
        _uploadingSide = side;
      });

      final imageUrl = await _uploadSingleImage(image.path, side);

      if (imageUrl != null) {
        final updatedCard = side == 'front'
            ? _currentCard.copyWith(frontImageUrl: imageUrl)
            : _currentCard.copyWith(backImageUrl: imageUrl);

        await cardController.updateCard(updatedCard);

        // Update the local state with the new card data
        setState(() {
          _currentCard = updatedCard;
        });
      }

      VLoaders.successSnackBar(
        title: 'Success',
        message: '$side image uploaded successfully',
      );
    } catch (e) {
      VLoaders.errorSnackBar(
        title: 'Error',
        message: e.toString(),
      );
    } finally {
      setState(() {
        _isUploading = false;
        _tempImageFile = null;
        _uploadingSide = '';
      });
    }
  }

  Widget _buildSingleSide(String? imageUrl, String side) {
    bool isCurrentSideUploading = _isUploading && _uploadingSide == side;
    String? currentImageUrl = side == 'front'
        ? _currentCard.frontImageUrl
        : _currentCard.backImageUrl;
    File? displayImage = side == _uploadingSide ? _tempImageFile : null;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 120),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () => _showImageSourceDialog(side),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (displayImage != null)
                    Image.file(
                      displayImage,
                      fit: BoxFit.contain,
                    )
                  else if (currentImageUrl != null &&
                      currentImageUrl.isNotEmpty)
                    InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 4.0,
                      child: Image.network(
                        currentImageUrl,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error_outline,
                                  size: 48, color: Colors.red),
                              SizedBox(height: 16),
                              Text('Failed to load image',
                                  style: TextStyle(color: Colors.red[700])),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_photo_alternate,
                              size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'Tap to add ${side} image',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (isCurrentSideUploading)
                    Container(
                      color: Colors.black54,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Uploading...',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('${side.toUpperCase()} SIDE'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.add_photo_alternate),
                onPressed: () => _showImageSourceDialog(side),
                tooltip: 'Add ${side} image',
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildSingleSide(_currentCard.frontImageUrl, 'front'),
              _buildSingleSide(_currentCard.backImageUrl, 'back'),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 2; i++)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == i
                          ? Theme.of(context).primaryColor
                          : Colors.grey[300],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardImagePage extends StatelessWidget {
  final CardModel card;

  const CardImagePage({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardDualImageUpload(card: card);
  }
}
