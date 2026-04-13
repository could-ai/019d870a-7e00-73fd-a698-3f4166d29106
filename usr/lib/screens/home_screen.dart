import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/reservation_provider.dart';
import 'reservation_form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reservations = context.watch<ReservationProvider>().reservations;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prenotazioni Ristorante'),
        centerTitle: true,
      ),
      body: reservations.isEmpty
          ? const Center(
              child: Text(
                'Nessuna prenotazione. Aggiungine una!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: reservations.length,
              itemBuilder: (context, index) {
                final res = reservations[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text('${res.name} - ${res.numberOfPeople} persone'),
                    subtitle: Text(
                      '${DateFormat('dd/MM/yyyy HH:mm').format(res.date)}\n'
                      '${res.specialRequests?.isNotEmpty == true ? "Note: ${res.specialRequests}" : ""}',
                    ),
                    isThreeLine: res.specialRequests?.isNotEmpty == true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context.read<ReservationProvider>().cancelReservation(res.id);
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReservationFormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
