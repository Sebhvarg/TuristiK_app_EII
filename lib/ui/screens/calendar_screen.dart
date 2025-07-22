import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:turistik/core/constants/colors.dart';
import '../../data/user_tickets.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<UserTicket>> _userEvents = {};

  @override
  void initState() {
    super.initState();
    _loadUserEvents();
  }

  void _loadUserEvents() {
    _userEvents.clear();
    for (var ticket in getUserTickets()) {
      // Parsear la fecha del ticket (formato: dd/MMM/yyyy | HH:mm)
      final fecha = ticket.fechaHora.split('|').first.trim();
      final partes = fecha.split('/');
      if (partes.length == 3) {
        final day = int.tryParse(partes[0]) ?? 1;
        final monthStr = partes[1].toLowerCase();
        final year = int.tryParse(partes[2]) ?? 2025;
        final monthMap = {
          'ene': 1,
          'feb': 2,
          'mar': 3,
          'abr': 4,
          'may': 5,
          'jun': 6,
          'jul': 7,
          'ago': 8,
          'sep': 9,
          'oct': 10,
          'nov': 11,
          'dic': 12,
        };
        final month = monthMap[monthStr.substring(0, 3)] ?? 1;
        final date = DateTime(year, month, day);
        _userEvents.putIfAbsent(date, () => []).add(ticket);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadUserEvents();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calendario de Eventos",
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (day) =>
                _userEvents[DateTime(day.year, day.month, day.day)] ?? [],
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
              defaultTextStyle: const TextStyle(color: AppColors.text),
              weekendTextStyle: const TextStyle(color: Colors.redAccent),
              markerDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (_selectedDay != null) ...[
            Text(
              "Has seleccionado: ${_selectedDay!.toLocal().toString().split(' ')[0]}",
              style: const TextStyle(fontSize: 16),
            ),
            ...?_userEvents[DateTime(
                  _selectedDay!.year,
                  _selectedDay!.month,
                  _selectedDay!.day,
                )]
                ?.map(
                  (ticket) => Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.confirmation_num_outlined,
                        color: Colors.green,
                      ),
                      title: Text(
                        ticket.obra,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Asientos: ${ticket.asientos.join(", ")}'),
                          Text('Ubicación: ${ticket.ubicacion}'),
                          Text('Fecha y Hora: ${ticket.fechaHora}'),
                          Text('Cantidad: ${ticket.cantidad}'),
                        ],
                      ),
                    ),
                  ),
                ),
          ],
        ],
      ),
    );
  }
}
