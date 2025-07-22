import 'package:flutter/material.dart';
import 'package:turistik/core/constants/colors.dart';
import '../../data/user_tickets.dart';
import 'qr.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tickets = getUserTickets();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          'Tus Entradas',
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: tickets.isEmpty
          ? const Center(
              child: Text(
                'Aquí aparecerán tus entradas compradas 🎫',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: const Icon(Icons.confirmation_num_outlined, size: 36, color: Colors.green),
                    title: Text(ticket.obra, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Asientos: ${ticket.asientos.join(", ")}'),
                        Text('Ubicación: ${ticket.ubicacion}'),
                        Text('Fecha y Hora: ${ticket.fechaHora}'),
                        Text('Cantidad: ${ticket.cantidad}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.qr_code, size: 32),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QRScreen(
                              ticketCount: ticket.cantidad,
                              asientos: ticket.asientos,
                              obra: ticket.obra,
                              ubicacion: ticket.ubicacion,
                              fechaHora: ticket.fechaHora,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
