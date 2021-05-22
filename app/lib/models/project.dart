import 'package:yui/models/tag.dart';

enum GainFactor {
  low,
  medium,
  high,
  exponential
}

class Project {
  String name;
  String? description;
  GainFactor? gainFactor;
  List<Tag>? tags;

  late DateTime createdAt;
  DateTime? completedAt;

  Project(this.name, this.description, this.gainFactor, this.tags) {
    this.createdAt = DateTime.now();
  }
}