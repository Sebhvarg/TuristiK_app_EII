import 'package:flutter/material.dart';
import 'qr.dart';
import '../../data/user_tickets.dart';

class SuccessBuyScreen extends StatefulWidget {
  final int ticketCount;
  final List<String> asientos;
  final String obra;
  final String ubicacion;
  final String fechaHora;
  const SuccessBuyScreen({super.key, required this.ticketCount, required this.asientos, required this.obra, required this.ubicacion, required this.fechaHora});

  @override
  State<SuccessBuyScreen> createState() => _SuccessBuyScreenState();
}

class _SuccessBuyScreenState extends State<SuccessBuyScreen> {
  @override
  void initState() {
    super.initState();
    // Guardar el ticket comprado
    addUserTicket(UserTicket(
      obra: widget.obra,
      asientos: widget.asientos,
      ubicacion: widget.ubicacion,
      fechaHora: widget.fechaHora,
      cantidad: widget.ticketCount,
    ));
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QRScreen(
            ticketCount: widget.ticketCount,
            asientos: widget.asientos,
            obra: widget.obra,
            ubicacion: widget.ubicacion,
            fechaHora: widget.fechaHora,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Compra exitosa!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            const Icon(Icons.check, color: Colors.green, size: 64),
            const SizedBox(height: 16),
            // Puedes reemplazar esto por una imagen SVG o PNG si tienes el asset
            Icon(Icons.theater_comedy, size: 100, color: Colors.teal.shade700),
            const SizedBox(height: 40),
            const Text(
              'Nos vemos en el Show!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
