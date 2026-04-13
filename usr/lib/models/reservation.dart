class Reservation {
  final String id;
  final String name;
  final DateTime date;
  final int numberOfPeople;
  final String? specialRequests;

  Reservation({
    required this.id,
    required this.name,
    required this.date,
    required this.numberOfPeople,
    this.specialRequests,
  });
}
