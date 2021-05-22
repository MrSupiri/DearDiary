import 'package:flutter/material.dart';

class Tag {
  String name;
  Color? color;
  String? description;
  late DateTime createdAt;

  Tag(this.name, this.color, this.description) {
    this.createdAt = DateTime.now();
  }
}