import 'dart:ffi';

class Showtime{
  final int id;
  final String playDate;
  final String playTime;
  final int capacity;
  final Float unitPrice;

  Showtime({
    required this.id,
    required this.playDate,
    required this.playTime,
    required this.capacity,
    required this.unitPrice,
  });
}