import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'restaurant_detail_page.dart';
import 'ideas_page.dart';

class RestaurantPage extends StatefulWidget {
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_selectedIndex) {
      case 0:
        Navigator.pushReplacementNamed(context, '/restaurants');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/ideas');
        break;
      case 3:
      // Naviga alla pagina del Basket
        break;
      case 4:
      // Naviga alla pagina del Profilo
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ristoranti'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                color: Colors.grey,
                child: Icon(Icons.image, color: Colors.white),
              ),
              title: Text(
                restaurants[index]["name"]!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurants[index]["address"]!),
                  SizedBox(height: 4.0),
                  Text(
                    "Distanza: ${restaurants[index]["distance"]}",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(
                        "Da: ${restaurants[index]["postedBy"]}",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      if (restaurants[index]["isVerified"])
                        Icon(Icons.check_circle, color: Colors.blue, size: 16),
                    ],
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestaurantDetailPage(
                      name: restaurants[index]["name"]!,
                      address: restaurants[index]["address"]!,
                      distance: restaurants[index]["distance"]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  final List<Map<String, dynamic>> restaurants = [
    {
      "name": "Ristorante da Mario",
      "address": "Via Roma 10, Milano",
      "distance": "1.2 km",
      "postedBy": "Proprietario",
      "isVerified": true,
    },
    {
      "name": "Trattoria Bella Italia",
      "address": "Corso Italia 22, Firenze",
      "distance": "3.5 km",
      "postedBy": "Utente",
      "isVerified": false,
    },
    {
      "name": "Pizzeria La Dolce Vita",
      "address": "Via Napoli 15, Roma",
      "distance": "2.1 km",
      "postedBy": "Utente",
      "isVerified": true,
    },
    {
      "name": "Osteria del Buongustaio",
      "address": "Piazza Duomo 1, Pisa",
      "distance": "0.8 km",
      "postedBy": "Proprietario",
      "isVerified": true,
    },
    {
      "name": "Ristorante Il Gusto",
      "address": "Viale dei Pini 45, Napoli",
      "distance": "4.2 km",
      "postedBy": "Utente",
      "isVerified": false,
    },
    {
      "name": "Trattoria Al Dente",
      "address": "Via Dante 18, Venezia",
      "distance": "2.7 km",
      "postedBy": "Proprietario",
      "isVerified": true,
    },
    {
      "name": "Ristorante La Perla",
      "address": "Via Garibaldi 12, Torino",
      "distance": "1.5 km",
      "postedBy": "Proprietario",
      "isVerified": true,
    },
    {
      "name": "Osteria San Marco",
      "address": "Piazza San Marco 6, Venezia",
      "distance": "3.0 km",
      "postedBy": "Utente",
      "isVerified": false,
    },
    {
      "name": "Pizzeria Bella Napoli",
      "address": "Via Toledo 33, Napoli",
      "distance": "2.2 km",
      "postedBy": "Proprietario",
      "isVerified": true,
    },
    {
      "name": "Ristorante Il Sorriso",
      "address": "Corso Umberto I 40, Milano",
      "distance": "4.5 km",
      "postedBy": "Utente",
      "isVerified": true,
    },
    {
      "name": "Trattoria Da Enzo",
      "address": "Via della Scala 15, Firenze",
      "distance": "1.8 km",
      "postedBy": "Proprietario",
      "isVerified": true,
    },
    {
      "name": "Ristorante La Torre",
      "address": "Via Torre Argentina 22, Roma",
      "distance": "3.7 km",
      "postedBy": "Utente",
      "isVerified": false,
    },
    // Aggiungi altri ristoranti qui
  ];
}
