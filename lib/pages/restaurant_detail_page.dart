import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatelessWidget {
  final String name;
  final String address;
  final String distance;

  RestaurantDetailPage({
    required this.name,
    required this.address,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        automaticallyImplyLeading: true, // Mostra il pulsante "Indietro"
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Immagine Segnaposto
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
                child: Icon(Icons.image, color: Colors.white, size: 100),
              ),
              SizedBox(height: 16.0),
              // Nome del Ristorante
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              // Indirizzo del Ristorante
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.red),
                  SizedBox(width: 4.0),
                  Expanded(
                    child: Text(
                      address,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              // Distanza del Ristorante
              Row(
                children: [
                  Icon(Icons.directions_walk, color: Colors.green),
                  SizedBox(width: 4.0),
                  Text(
                    "Distanza: $distance",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              // Descrizione del Ristorante
              Text(
                "Descrizione del ristorante...",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              // Sezione Aggiuntiva (es. Orari, Menu, Recensioni, etc.)
              // Puoi aggiungere ulteriori dettagli qui
            ],
          ),
        ),
      ),
    );
  }
}
