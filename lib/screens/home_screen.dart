import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/superhero.dart';
import '../widgets/superhero_card.dart';

class HomeScreen extends StatefulWidget {
  static final List<Superhero> heroesList = [];

  static void addHeroToList(Superhero hero) {
    heroesList.add(hero);
  }

  static void removeHeroFromList(String id) {
    heroesList.removeWhere((hero) => hero.id == id);
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Héroes'),
      ),
      body: HomeScreen.heroesList.isEmpty
          ? Center(child: Text("No hay héroes en la lista"))
          : ListView.builder(
        itemCount: HomeScreen.heroesList.length,
        itemBuilder: (context, index) {
          return SuperheroCard(superhero: HomeScreen.heroesList[index]);
        },
      ),
    );
  }
}
