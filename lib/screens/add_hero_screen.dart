import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/superhero.dart';
import 'home_screen.dart';

class AddHeroScreen extends StatefulWidget {
  @override
  _AddHeroScreenState createState() => _AddHeroScreenState();
}

class _AddHeroScreenState extends State<AddHeroScreen> {
  final ApiService apiService = ApiService();
  final TextEditingController controller = TextEditingController();
  bool loading = false;

  void addHero(String id) async {
    setState(() {
      loading = true;
    });

    try {
      Superhero newHero = await apiService.getSuperhero(id);
      HomeScreen.addHeroToList(newHero); // Agregar héroe a la lista global
      setState(() {
        loading = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Héroe Agregado"),
            content: Text("¡Héroe ${newHero.name} agregado exitosamente!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cerrar"),
              ),
            ],
          );
        },
      );
    } catch (e) {
      setState(() {
        loading = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("No se pudo agregar el héroe."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cerrar"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agregar Héroe")),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/2.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'ID del Superhéroe',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                    style: TextStyle(fontSize: 18), // Aumenta el tamaño de la letra
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        addHero(controller.text);
                      }
                    },
                    child: Text(
                      'Agregar',
                      style: TextStyle(fontSize: 18), // Aumenta el tamaño de la letra
                    ),
                  ),
                  if (loading) CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
