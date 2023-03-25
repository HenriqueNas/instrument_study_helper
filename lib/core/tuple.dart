class Tuple<T, G> {
  final T $0;
  final G $1;

  Tuple(this.$0, this.$1);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tuple &&
          runtimeType == other.runtimeType &&
          $0 == other.$0 &&
          $1 == other.$1;

  @override
  int get hashCode => $0.hashCode ^ $1.hashCode;

  @override
  String toString() {
    return 'Tuple: (${this.$0}, ${this.$1})';
  }
}
