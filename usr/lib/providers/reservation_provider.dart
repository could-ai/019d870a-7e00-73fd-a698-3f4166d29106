import 'package:flutter/material.dart';
import '../models/reservation.dart';

class ReservationProvider with ChangeNotifier {
  final List<Reservation> _reservations = [];

  List<Reservation> get reservations => [..._reservations];

  void addReservation(Reservation reservation) {
    _reservations.add(reservation);
    notifyListeners();
  }

  void cancelReservation(String id) {
    _reservations.removeWhere((res) => res.id == id);
    notifyListeners();
  }
}
