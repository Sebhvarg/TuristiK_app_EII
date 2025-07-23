import 'package:flutter/material.dart';
import 'package:turistik/data/models/event_model.dart';
import 'seleccion_asientos.dart';

class TicketBuyScreen extends StatefulWidget {
  final EventModel event;
  const TicketBuyScreen({super.key, required this.event});

  @override
  State<TicketBuyScreen> createState() => _TicketBuyScreenState();
}

class _TicketBuyScreenState extends State<TicketBuyScreen> {
  int ticketCount = 1;

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    final price = event.price ?? 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          "Boletos para: ${event.title}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Seleccione los boletos',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.confirmation_num_outlined,
                      size: 32,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        price > 0
                            ? ' \$${price.toStringAsFixed(0)} por persona'
                            : 'Gratis',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.white),
                      onPressed: ticketCount > 1
                          ? () => setState(() => ticketCount--)
                          : null,
                    ),
                    Text(
                      '$ticketCount',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: ticketCount < 9
                          ? () => setState(() => ticketCount++)
                          : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '${event.date} - ${event.hour}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                event.location,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://maps.googleapis.com/maps/api/staticmap?center=${Uri.encodeComponent(event.location)}&zoom=16&size=400x200&markers=color:red%7C${Uri.encodeComponent(event.location)}&key=AIzaSyDUMMYKEY',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade300,
                    height: 180,
                    width: double.infinity,
                    child: const Center(
                      child: Icon(Icons.map, size: 60, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'El valor final de las entradas aún no están aplicados',
                style: TextStyle(fontSize: 13, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeleccionAsientosScreen(
                          ticketCount: ticketCount,
                          event: event,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Seleccionar asientos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
