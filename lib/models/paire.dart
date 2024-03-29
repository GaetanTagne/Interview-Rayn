class Pair {
  final int first;
  final int second;

  Pair(this.first, this.second);

  @override
  String toString() {
    return "[$first,$second]";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pair &&
          runtimeType == other.runtimeType &&
          (first == other.first && second == other.second);

  @override
  int get hashCode => first.hashCode ^ second.hashCode;
}
