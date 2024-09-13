import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class IdeasPage extends StatefulWidget {
  @override
  _IdeasPageState createState() => _IdeasPageState();
}

class _IdeasPageState extends State<IdeasPage> {
  int _selectedIndex = 1; // Imposta l'indice a 1 per "Idee"

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
        title: Text('Idee'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: ideas.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: Text(
                ideas[index],
                style: TextStyle(fontSize: 16),
              ),
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

  final List<String> ideas = [
    "Lorem ipsum dolor sit amet",
    "Consectetur adipiscing elit",
    "Sed do eiusmod tempor incididunt",
    "Ut labore et dolore magna aliqua",
    "Ut enim ad minim veniam",
  ];
}
