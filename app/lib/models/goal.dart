import 'package:yui/models/project.dart';
import 'package:yui/models/tag.dart';

class Goal {
  String name;
  String reason;
  Project? project;
  List<Tag>? tags;

  late DateTime createdAt;
  DateTime? completedAt;

  Goal(this.name, this.reason, this.project, this.tags) {
    this.createdAt = DateTime.now();
  }
}