import 'package:flutter/material.dart';

class RemoveHeroScreen extends StatefulWidget {
  @override
  _RemoveHeroScreenState createState() => _RemoveHeroScreenState();
}

class _RemoveHeroScreenState extends State<RemoveHeroScreen> {
  final TextEditingController controller = TextEditingController();
  bool loading = false;

  void removeHero(String id) async {
    setState(() {
      loading = true;
    });

    // Aquí eliminarías el héroe de tu base de datos o lista
    // Este código es solo para simular el proceso
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      loading = false;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Héroe Eliminado"),
          content: Text("¡Héroe con ID $id eliminado exitosamente!"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Eliminar Héroe")),
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
                  removeHero(controller.text);
                }
              },
              child: Text('Eliminar'),
            ),
            if (loading) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
