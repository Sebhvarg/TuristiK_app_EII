import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../data/models/event_model.dart';
import 'event_card.dart';

class EventSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<EventModel> events;

  const EventSection({
    super.key,
    required this.title,
    required this.icon,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 370,
            enableInfiniteScroll: false,
            viewportFraction: 0.8,
            padEnds: false,
          ),
          items: events.map((event) => EventCard(event: event)).toList(),
        ),

        const SizedBox(height: 40),
      ],
    );
  }
}
