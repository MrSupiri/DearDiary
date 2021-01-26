class TaggedTimes {
  static final TaggedTimes _taggedTimes = new TaggedTimes._internal();
  Map<String, bool> tagTimes = {};

  factory TaggedTimes() {
    return _taggedTimes;
  }
  TaggedTimes._internal();

  bool checkTag(String time) {
    if (tagTimes.containsKey(time)) {
      return tagTimes[time];
    } else {
      addTime(time);
      return false;
    }
  }

  void addTime(String time) {
    tagTimes[time] = false;
  }

  void tagTime(String time) {
    tagTimes[time] = true;
  }

  void unTagTime(String time) {
    tagTimes[time] = false;
  }

  bool toggleTime(String time) {
    bool currentState = checkTag(time);
    tagTimes[time] = !currentState;
    return currentState;
  }

  List<String> getTaggedTimes() {
    List<String> taggedTimes = [];
    tagTimes.forEach((String k, bool v) => {
          if (v) {taggedTimes.add(k)}
        });
    return taggedTimes;
  }
}

final taggedTimes = TaggedTimes();
