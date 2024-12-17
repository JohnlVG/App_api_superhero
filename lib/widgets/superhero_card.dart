import 'package:flutter/material.dart';
import '../models/superhero.dart';

class SuperheroCard extends StatelessWidget {
  final Superhero superhero;

  SuperheroCard({required this.superhero});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 5,
      child: Column(
        children: [
          Image.network(superhero.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(superhero.name, style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: 8),
                Text(superhero.biography, maxLines: 3, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
