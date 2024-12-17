import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/superhero.dart';

class ApiService {
  final String _baseUrl = 'https://www.superheroapi.com/api.php';
  final String _token = 'a5d75371ab51eaa2c07c28ee126fc1e0';

  Future<Superhero> getSuperhero(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$_token/$id'));

    if (response.statusCode == 200) {
      return Superhero.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al cargar los datos del superhéroe');
    }
  }
}
