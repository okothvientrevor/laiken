import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

class CardModel {
  final String id;
  final String? userId;
  final String? cardNumber;
  final String? expiryDate;
  final String? storeName;
  final String? frontImageUrl;
  final String? backImageUrl;
  final String? notes;
  final Color? storeColor;
  final String? logoPath;

  CardModel({
    String? id,
    this.userId,
    this.cardNumber,
    this.expiryDate,
    this.storeName,
    this.frontImageUrl,
    this.backImageUrl,
    this.notes,
    this.storeColor,
    this.logoPath,
  }) : this.id = id ?? Uuid().v4();

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      cardNumber: json['CardNumber'] as String? ?? '',
      expiryDate: json['expiryDate'] as String? ?? '',
      storeName: json['StoreName'] as String? ?? '',
      frontImageUrl: json['FrontImageUrl'] as String? ?? '',
      backImageUrl: json['BackImageUrl'] as String? ?? '',
      notes: json['Notes'] as String? ?? '',
      storeColor: json['storeColor'] != null
          ? Color(int.parse(json['storeColor']))
          : null,
      logoPath: json['logoPath'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'CardNumber': cardNumber ?? '',
      'expiryDate': expiryDate ?? '',
      'StoreName': storeName ?? '',
      'FrontImageUrl': frontImageUrl ?? '',
      'BackImageUrl': backImageUrl ?? '',
      'Notes': notes ?? '',
      'storeColor': storeColor?.value.toString(),
      'logoPath': logoPath ?? '',
    };
  }

  CardModel copyWith({
    String? id,
    String? userId,
    String? cardNumber,
    String? expiryDate,
    String? storeName,
    String? frontImageUrl,
    String? backImageUrl,
    String? notes,
    Color? storeColor,
    String? logoPath,
  }) {
    return CardModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      cardNumber: cardNumber ?? this.cardNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      storeName: storeName ?? this.storeName,
      frontImageUrl: frontImageUrl ?? this.frontImageUrl,
      backImageUrl: backImageUrl ?? this.backImageUrl,
      notes: notes ?? this.notes,
      storeColor: storeColor ?? this.storeColor,
      logoPath: logoPath ?? this.logoPath,
    );
  }
}
