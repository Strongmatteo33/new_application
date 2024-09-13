import 'package:flutter/material.dart';
import '../pages/restaurant_page.dart';
import '../pages/ideas_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.store),
                label: 'Vetrina',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.lightbulb),
                label: 'Idee',
              ),
              BottomNavigationBarItem(
                icon: Icon(null), // Placeholder for the central button
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                label: 'Basket',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontSize: 12),
            unselectedLabelStyle: TextStyle(fontSize: 10),
            onTap: (index) {
              _navigateToPageWithoutAnimation(context, index);
              onItemTapped(index);
            },
            type: BottomNavigationBarType.fixed,
          ),
        ),
        Positioned(
          bottom: 20.0, // Adjust based on your design needs
          child: FloatingActionButton(
            onPressed: () {
              // Add specific action for the central button
            },
            backgroundColor: Colors.purple, // Change the color if needed
            child: Icon(Icons.search), // Change the icon if needed
          ),
        ),
      ],
    );
  }

  void _navigateToPageWithoutAnimation(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = RestaurantPage(); // Importa la tua pagina ristorante
        break;
      case 1:
        page = IdeasPage(); // Importa la tua pagina idee
        break;
    // Aggiungi altre case per le altre pagine se necessario
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RestaurantPage()),
    );

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: Duration.zero, // Rimuove l'animazione
        reverseTransitionDuration: Duration.zero, // Rimuove l'animazione inversa
      ),
    );
  }

}
