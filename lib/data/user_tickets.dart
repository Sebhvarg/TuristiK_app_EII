class UserTicket {
  final String obra;
  final List<String> asientos;
  final String ubicacion;
  final String fechaHora;
  final int cantidad;

  UserTicket({
    required this.obra,
    required this.asientos,
    required this.ubicacion,
    required this.fechaHora,
    required this.cantidad,
  });
}

List<UserTicket> userTickets = [];

void addUserTicket(UserTicket ticket) {
  userTickets.add(ticket);
}

List<UserTicket> getUserTickets() => userTickets; 