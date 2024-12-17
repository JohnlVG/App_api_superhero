import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../services/api_service.dart';
import '../models/superhero.dart';

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
      // Aquí puedes agregar el héroe a tu base de datos local o lista
      // Por ahora solo muestra el héroe en pantalla
      setState(() {
        loading = false;
      });
      // Mostrar el superhéroe agregado
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'ID del Superhéroe',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  addHero(controller.text);
                }
              },
              child: Text('Agregar'),
            ),
            if (loading) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
