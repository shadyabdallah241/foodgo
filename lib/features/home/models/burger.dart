class Burger {
  final String id;
  final String image;
  final String name;
  final String shortDescription;
  final double rating;

  const Burger({
    required this.id,
    required this.image,
    required this.name,
    required this.shortDescription,
    required this.rating,
  });
  Burger copyWith({bool? isFavorite}) => Burger(
    id: id,
    image: image,
    name: name,
    shortDescription: shortDescription,
    rating: rating,
  );

}
