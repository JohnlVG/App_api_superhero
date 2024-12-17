import 'package:flutter/material.dart';
import 'home_screen.dart'; // Ya existe el HomeScreen para agregar héroe
import 'add_hero_screen.dart'; // Nueva pantalla para agregar héroe
import 'remove_hero_screen.dart'; // Nueva pantalla para eliminar héroe

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Principal',
          style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),

        ),
      ),
      body: Stack(
        children: [
          // Imagen de fondo, ocupa toda la pantalla
          Positioned.fill(
            child: Image.asset(
              'assets/1.png',
              fit: BoxFit.cover, // Asegura que la imagen ocupe toda la pantalla
            ),
          ),
          Center( // Centro la columna que contiene los botones
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos verticalmente
                crossAxisAlignment: CrossAxisAlignment.center, // Centra los elementos horizontalmente
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddHeroScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50), // Botón más grande y con ancho máximo
                    ),
                    child: Text(
                      'Agregar Héroe',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Centra el texto en el botón
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RemoveHeroScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50), // Botón más grande y con ancho máximo
                    ),
                    child: Text(
                      'Eliminar Héroe',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Centra el texto en el botón
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50), // Botón más grande y con ancho máximo
                    ),
                    child: Text(
                      'Visualizar Lista',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Centra el texto en el botón
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
