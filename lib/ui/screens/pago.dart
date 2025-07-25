import 'package:flutter/material.dart';
import 'package:turistik/data/models/event_model.dart';
import 'success_buy.dart';

class PagoScreen extends StatelessWidget {
  final int ticketCount;
  final double ticketPrice;
  final EventModel event;
  const PagoScreen({
    super.key,
    required this.ticketCount,
    required this.ticketPrice,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    // Cálculos de ejemplo
    final double serviceFee = 3.0;
    final double premiumDiscount = 1.5;
    final double total =
        (ticketPrice * ticketCount) + serviceFee - premiumDiscount;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(2, 94, 115, 1.0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pago',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Text(
              'Resumen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(
                  Icons.confirmation_num_outlined,
                  size: 36,
                  color: Color.fromRGBO(2, 94, 115, 1.0),
                ),
                const SizedBox(width: 10),
                Text(
                  '$ticketCount Boletos para: ${event.title}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Detalles',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Divider(
              color: Colors.grey, // Color personalizado
              thickness: 1,
              height: 16, // Espacio vertical que ocupa el Divider
            ),

            const SizedBox(height: 10),
            _detalleLinea('Boleto x$ticketCount', ticketPrice * ticketCount),
            _detalleLinea('Tarifa servicio', serviceFee),
            _detalleLinea('Descuento premium', -premiumDiscount),
            const SizedBox(height: 8),
            Divider(
              color: Color.fromRGBO(2, 94, 115, 1.0), // Color personalizado
              thickness: 2,
              height: 16, // Espacio vertical que ocupa el Divider
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  '  ${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Seleccione método de pago',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 1), // Color azul petróleo
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.credit_card,
                    size: 28,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Visa ***451',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(2, 94, 115, 1.0),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color.fromRGBO(2, 94, 115, 1.0),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              'Al comprar el boleto acepta todos los términos y condiciones',
              style: TextStyle(fontSize: 12, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Datos de ejemplo, reemplaza por los reales si los tienes
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessBuyScreen(
                        ticketCount: ticketCount,
                        asientos: [
                          'C2',
                          'C3',
                        ], // Reemplaza por los asientos reales
                        obra: event.title,
                        ubicacion: event.location,
                        fechaHora: '${event.date} | ${event.hour}',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Pagar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }

  Widget _detalleLinea(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            (value < 0 ? '- ' : '') + '  ${value.abs().toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 15,
              color: value < 0 ? Colors.green : Colors.black,
              fontWeight: value < 0 ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
