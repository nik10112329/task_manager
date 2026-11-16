import 'package:flutter/material.dart';

class TMHomeCardData {
  TMHomeCardData({
    required this.id,
    required this.name,
    required this.topTitle,
    this.date,
    this.icon,
  });

  String name;
  String id;
  String topTitle;
  String? date;
  IconData? icon;
}
