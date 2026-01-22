class SeatMapper {
  static String seatLabel(int row, int col) {
    final rowLetter = String.fromCharCode(65 + row);
    return '$rowLetter$col';
  }
}
