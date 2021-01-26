class TaggedTasks {
  static final TaggedTasks _taggedTasks = new TaggedTasks._internal();
  Map<String, bool> tagTaks = {};

  factory TaggedTasks() {
    return _taggedTasks;
  }
  TaggedTasks._internal();

  bool checkTag(String task) {
    if (tagTaks.containsKey(task)) {
      return tagTaks[task];
    } else {
      addtask(task);
      return false;
    }
  }

  void addtask(String task) {
    tagTaks[task] = false;
  }

  void tagtask(String task) {
    tagTaks[task] = true;
  }

  void unTagtask(String task) {
    tagTaks[task] = true;
  }

  void clearTags() {
    tagTaks = {};
  }

  bool toggletask(String task) {
    bool currentState = checkTag(task);
    tagTaks[task] = !currentState;
    return currentState;
  }

  List<String> getTaggedTasks() {
    List<String> taggedTasks = [];
    tagTaks.forEach((String k, bool v) => {
          if (v) {taggedTasks.add(k)}
        });
    return taggedTasks;
  }
}

final taggedTasks = TaggedTasks();
