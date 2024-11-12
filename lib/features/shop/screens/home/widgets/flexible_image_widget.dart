import 'package:flutter/material.dart';

class FlexibleImageWidget extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const FlexibleImageWidget({
    super.key,
    required this.imagePath,
    this.width = 100,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath.startsWith('http')) {
      // It's a URL, use Image.network
      return Image.network(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          print('Error loading image: $error');
          return Icon(Icons.error, size: width < height ? width : height);
        },
      );
    } else {
      // It's not a URL, assume it's an asset path
      return Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          print('Error loading asset: $error');
          return Icon(Icons.error, size: width < height ? width : height);
        },
      );
    }
  }
}
