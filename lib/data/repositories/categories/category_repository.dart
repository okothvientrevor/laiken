import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store/data/services/firebase_storage_service.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/utils/exceptions/firebase_auth_exception.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();

      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();

      return list;
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const VFormatException();
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get Sub categories

  //Upload categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(VFirebaseStorageService());

      for (var category in categories) {
        try {
          print("Processing category: ${category.name}");

          // Check if the image is a local asset path or already a URL
          if (!category.image.startsWith('http')) {
            // Get ImageData link from local assets
            final file = await storage.getImageDataFromAssets(category.image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Categories', file, category.name);

            // Assign url to category .image attribute
            category.image = url;
          }

          // Store Category in Firebase
          await _db
              .collection("Categories")
              .doc(category.id)
              .set(category.toJson());

          print("Successfully uploaded category: ${category.name}");
        } catch (e) {
          print("Error processing category ${category.name}: $e");
          // Continue with the next category instead of breaking the entire process
          continue;
        }
      }
    } catch (e) {
      print("Unexpected error: $e");
      throw 'Something went wrong. Please try again';
    }
  }
}
