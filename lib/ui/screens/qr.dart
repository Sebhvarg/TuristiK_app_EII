import 'package:flutter/material.dart';
import 'package:turistik/ui/screens/main_screen.dart';

class QRScreen extends StatelessWidget {
  final int ticketCount;
  final List<String> asientos;
  final String obra;
  final String ubicacion;
  final String fechaHora;
  const QRScreen({
    super.key,
    required this.ticketCount,
    required this.asientos,
    required this.obra,
    required this.ubicacion,
    required this.fechaHora,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),

          onPressed: () {
            Navigator.pop(context); // Cierra el QR si fue push
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MainScreen(initialIndex: 1), // 1 = Tickets
              ),
            );
          },
        ),
        title: const Text(
          'Entrada',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Tus boletos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey, // Color personalizado
              thickness: 2,
              height: 16, // Espacio vertical que ocupa el Divider
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.confirmation_num_outlined,
                  size: 32,
                  color: Color.fromRGBO(2, 94, 115, 1.0),
                ),
                const SizedBox(width: 4),
                Text(
                  ticketCount.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(2, 94, 115, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            // QR
            Image.asset(
              'assets/img/qr/qr.png',
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            const Text(
              '*Presenta este código QR para entrar al evento',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 18),
            Container(
              width: 340,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    obra,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Asientos: ${asientos.join(", ")}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ubicación: $ubicacion',
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Fecha y Hora: $fechaHora',
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
