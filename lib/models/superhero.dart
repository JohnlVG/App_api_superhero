class Superhero {
  final String id;
  final String name;
  final String imageUrl;
  final String biography;

  Superhero({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.biography,
  });

  factory Superhero.fromJson(Map<String, dynamic> json) {
    return Superhero(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image']['url'],
      biography: json['biography']['full-name'] ?? 'No disponible',
    );
  }
}
