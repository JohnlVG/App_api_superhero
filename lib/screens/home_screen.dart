import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/superhero.dart';
import '../widgets/superhero_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Superhero>> superheroes;

  @override
  void initState() {
    super.initState();
    superheroes = fetchSuperheroes();
  }

  Future<List<Superhero>> fetchSuperheroes() async {
    List<Superhero> heroesList = [];
    for (int i = 1; i <= 25; i++) {
      heroesList.add(await apiService.getSuperhero(i.toString()));
    }
    return heroesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Héroes'),
      ),
      body: FutureBuilder<List<Superhero>>(
        future: superheroes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los héroes'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return SuperheroCard(superhero: snapshot.data![index]);
              },
            );
          } else {
            return Center(child: Text('No se encontraron héroes.'));
          }
        },
      ),
    );
  }
}
