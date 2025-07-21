import 'package:flutter/material.dart';
import 'pago.dart';

class SeleccionAsientosScreen extends StatefulWidget {
  final int ticketCount;
  const SeleccionAsientosScreen({super.key, required this.ticketCount});

  @override
  State<SeleccionAsientosScreen> createState() =>
      _SeleccionAsientosScreenState();
}

class _SeleccionAsientosScreenState extends State<SeleccionAsientosScreen> {
  // Simulación de asientos: 7 filas, 8 columnas (puedes ajustar)
  static const int rows = 7;
  static const int cols = 8;
  // 0: no disponible, 1: disponible, 2: seleccionado
  List<List<int>> seatStatus = List.generate(
    rows,
    (i) => List.generate(cols, (j) => (i < 2 && (j < 2 || j > 5)) ? 0 : 1),
  );
  List<Offset> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'TuristiK',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.confirmation_num_outlined, size: 28),
                const SizedBox(width: 4),
                Text(
                  widget.ticketCount.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            const Text(
              'Seleccione los asientos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Container(
              color: Colors.grey.shade300,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
              child: Column(
                children: [
                  const Text(
                    'Escenario',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 6,
                    width: 120,
                    color: Colors.black,
                  ),
                  // Asientos
                  SizedBox(
                    height: 300,
                    child: CustomPaint(
                      painter: _ArcPainter(),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(rows, (i) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(cols, (j) {
                                int status = seatStatus[i][j];
                                bool isSelected = selectedSeats.contains(
                                  Offset(i.toDouble(), j.toDouble()),
                                );
                                Color color;
                                if (status == 0) {
                                  color = Colors.black;
                                } else if (isSelected) {
                                  color = Theme.of(context).primaryColor;
                                } else {
                                  color = Colors.white;
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: GestureDetector(
                                    onTap: status == 1
                                        ? () {
                                            setState(() {
                                              if (isSelected) {
                                                selectedSeats.remove(
                                                  Offset(
                                                    i.toDouble(),
                                                    j.toDouble(),
                                                  ),
                                                );
                                              } else if (selectedSeats.length <
                                                  widget.ticketCount) {
                                                selectedSeats.add(
                                                  Offset(
                                                    i.toDouble(),
                                                    j.toDouble(),
                                                  ),
                                                );
                                              }
                                            });
                                          }
                                        : null,
                                    child: Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        color: color,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.2,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _legendDot(Colors.black),
                      const SizedBox(width: 4),
                      const Text('No disponible'),
                      const SizedBox(width: 12),
                      _legendDot(Colors.white),
                      const SizedBox(width: 4),
                      const Text('Disponible'),
                      const SizedBox(width: 12),
                      _legendDot(Theme.of(context).primaryColor),
                      const SizedBox(width: 4),
                      const Text('Seleccionado'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Los asientos se encuentran enumerados *',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 18),
            const Text(
              'Prevenciones y prohibiciones para asistir al teatro',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 12,
                children: [
                  _iconProhibido(Icons.fastfood),
                  _iconProhibido(Icons.local_drink),
                  _iconProhibido(Icons.smoking_rooms),
                  _iconProhibido(Icons.phone_android),
                  _iconProhibido(Icons.camera_alt),
                  _iconProhibido(Icons.pets),
                  _iconProhibido(Icons.volume_up),
                  _iconProhibido(Icons.flash_on),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Al comprar el boleto acepta todos los términos y condiciones',
              style: TextStyle(fontSize: 12, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedSeats.length == widget.ticketCount
                      ? () {
                          // Aquí puedes ajustar el precio según tu lógica, por ejemplo 5.0 por boleto
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PagoScreen(
                                ticketCount: widget.ticketCount,
                                ticketPrice: 5.0, // Cambia esto si tienes el precio real
                              ),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Ir a pagar',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _legendDot(Color color) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 1.2),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _iconProhibido(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(255, 255, 0, 0),
          width: 2,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(icon, size: 26, color: Colors.black),
          Positioned(
            child: Transform.rotate(
              angle: -0.7,
              child: Container(width: 100, height: 2.5, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final rect = Rect.fromLTWH(
      0,
      size.height * 0.1,
      size.width,
      size.height * 0.8,
    );
    canvas.drawArc(rect, 3.14, 3.14, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
