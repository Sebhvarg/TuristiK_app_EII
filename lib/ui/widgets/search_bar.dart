import 'package:flutter/material.dart';
import 'package:turistik/data/models/artist_musical_model.dart';
import 'package:turistik/data/models/artist_teatral_model.dart';
import 'package:turistik/data/models/event_musical_model.dart';
import 'package:turistik/data/models/event_teatral_model.dart';

class SearchBarWidget extends StatefulWidget {
  final List<MusicalEventModel> musicalEvents;
  final List<TeatralEventModel> teatralEvents;
  final List<MusicalArtistModel> musicalArtists;
  final List<TeatralArtistModel> teatralArtists;
  final Function(List<dynamic> results) onResults;

  const SearchBarWidget({
    super.key,
    required this.musicalEvents,
    required this.teatralEvents,
    required this.musicalArtists,
    required this.teatralArtists,
    required this.onResults,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _isSearching = false;

  void _onSearchChanged(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
    });

    if (query.isEmpty) {
      widget.onResults([]);
      return;
    }

    final lowerQuery = query.toLowerCase().trim();
    List<dynamic> allResults = [];

    // Buscar en eventos musicales - solo nombre del evento
    final musicalEventResults = widget.musicalEvents.where((event) {
      return event.title.toLowerCase().contains(lowerQuery);
    }).toList();

    // Buscar en eventos teatrales - solo nombre del evento
    final teatralEventResults = widget.teatralEvents.where((event) {
      return event.title.toLowerCase().contains(lowerQuery);
    }).toList();

    // Buscar en artistas musicales - solo nombre del artista
    final musicalArtistResults = widget.musicalArtists.where((artist) {
      return artist.name.toLowerCase().contains(lowerQuery);
    }).toList();

    // Buscar en artistas teatrales - solo nombre del artista
    final teatralArtistResults = widget.teatralArtists.where((artist) {
      return artist.name.toLowerCase().contains(lowerQuery);
    }).toList();

    // Combinar todos los resultados
    allResults.addAll(musicalEventResults);
    allResults.addAll(teatralEventResults);
    allResults.addAll(musicalArtistResults);
    allResults.addAll(teatralArtistResults);

    widget.onResults(allResults);
  }

  void _clearSearch() {
    _controller.clear();
    setState(() {
      _isSearching = false;
    });
    widget.onResults([]);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        onChanged: _onSearchChanged,
        decoration: InputDecoration(
          hintText: "Buscar artista, evento...",
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
          prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 24),
          suffixIcon: _isSearching
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey, size: 20),
                  onPressed: _clearSearch,
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
        ),
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}
