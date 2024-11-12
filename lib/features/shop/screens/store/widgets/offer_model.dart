import 'package:flutter/material.dart';

class OfferModel {
  final String? id;
  final String storeName;
  final String offerTitle;
  final String description;
  final String validUntil;
  final String discountPercent;
  final String couponCode;
  final Color storeColor;
  final String? userId;
  final DateTime createdAt;
  final DateTime expiryDate;
  final bool isActive;

  OfferModel({
    this.id,
    required this.storeName,
    required this.offerTitle,
    required this.description,
    required this.validUntil,
    required this.discountPercent,
    required this.couponCode,
    required this.storeColor,
    this.userId,
    DateTime? createdAt,
    DateTime? expiryDate,
    this.isActive = true,
  })  : createdAt = createdAt ?? DateTime.now(),
        expiryDate = expiryDate ?? DateTime.now().add(const Duration(days: 30));

  Map<String, dynamic> toJson() {
    return {
      'storeName': storeName,
      'offerTitle': offerTitle,
      'description': description,
      'validUntil': validUntil,
      'discountPercent': discountPercent,
      'couponCode': couponCode,
      'storeColor': storeColor.value,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
      'expiryDate': expiryDate.toIso8601String(),
      'isActive': isActive,
    };
  }

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      storeName: json['storeName'],
      offerTitle: json['offerTitle'],
      description: json['description'],
      validUntil: json['validUntil'],
      discountPercent: json['discountPercent'],
      couponCode: json['couponCode'],
      storeColor: Color(json['storeColor']),
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      expiryDate: DateTime.parse(json['expiryDate']),
      isActive: json['isActive'] ?? true,
    );
  }

  OfferModel copyWith({
    String? storeName,
    String? offerTitle,
    String? description,
    String? validUntil,
    String? discountPercent,
    String? couponCode,
    Color? storeColor,
    DateTime? expiryDate,
    bool? isActive,
  }) {
    return OfferModel(
      id: id,
      storeName: storeName ?? this.storeName,
      offerTitle: offerTitle ?? this.offerTitle,
      description: description ?? this.description,
      validUntil: validUntil ?? this.validUntil,
      discountPercent: discountPercent ?? this.discountPercent,
      couponCode: couponCode ?? this.couponCode,
      storeColor: storeColor ?? this.storeColor,
      userId: userId,
      createdAt: createdAt,
      expiryDate: expiryDate ?? this.expiryDate,
      isActive: isActive ?? this.isActive,
    );
  }
}
