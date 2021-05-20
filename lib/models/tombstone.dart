class Tombstone {
  final String name;
  final int streak;
  final String causeOfDeath;

  Tombstone(this.name, this.streak, this.causeOfDeath);

  @override
  String toString() {
    return '${name} : ${streak}';
  }
}
