enum SeatStatus { available, reserved, selected }

class SeatModel {
  final String id;
  final int row;
  final int column;
   SeatStatus status;

  SeatModel({
    required this.id,
    required this.row,
    required this.column,
    required this.status,
  });

  factory SeatModel.fromJson(Map<String, dynamic> json) {
    return SeatModel(
      id: json['id'] ?? '',
      row: json['row'] ?? 0,
      column: json['column'] ?? 0,
      status: _parseStatus(json['status']),
    );
  }

  static SeatStatus _parseStatus(String? status) {
    switch (status) {
      case 'reserved':
        return SeatStatus.reserved;
      case 'selected':
        return SeatStatus.selected;
      default:
        return SeatStatus.available;
    }
  }

  SeatModel copyWith(SeatStatus? status) {
    return SeatModel(
      id: id,
      row: row,
      column: column,
      status: status ?? this.status,
    );
  }
}
