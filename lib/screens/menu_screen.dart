import 'package:flutter/material.dart';
import 'home_screen.dart'; // Ya existe el HomeScreen para agregar heroe
import 'add_hero_screen.dart'; // Nueva pantalla para agregar héroe
import 'remove_hero_screen.dart'; // Nueva pantalla para eliminar héroe

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Principal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddHeroScreen()),
                );
              },
              child: Text('Agregar Héroe'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RemoveHeroScreen()),
                );
              },
              child: Text('Eliminar Héroe'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Visualizar Lista'),
            ),
          ],
        ),
      ),
    );
  }
}
