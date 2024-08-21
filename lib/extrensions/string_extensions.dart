extension StringExtension on String {
  String toTitleCase() {
    if (this.isEmpty) {
      return this;
    }

    return this
        .split(' ')
        .map((word) =>
    word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}' : '')
        .join(' ');
  }
}