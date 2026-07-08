enum Ingredient {
  tomato,
  onions,
  pickles,
  bacon,
  fries,
  coleslaw,
  salad,
  friedOnions,
}

enum PortionSize { small, medium, large }

enum SpicyLevel { mild, medium, hot }

enum BurgerCategory { all, cheese, veggie, fried, chicken }

extension BurgerCategoryX on BurgerCategory {
  String get label {
    switch (this) {
      case BurgerCategory.all:
        return "All";
      case BurgerCategory.cheese:
        return "Combos";
      case BurgerCategory.veggie:
        return "Veggie";
      case BurgerCategory.fried:
        return "Fried";
      case BurgerCategory.chicken:
        return "Chicken";
    }
  }
}

class Burger {
  final String id;
  final String image;
  final String name;
  final String shortDescription;
  final double rating;
  final int duration;
  final String description;

  final PortionSize portion;
  final SpicyLevel spicyLevel;
  final List<Ingredient> ingredients;
  final BurgerCategory category;

  const Burger({
    required this.id,
    required this.image,
    required this.name,
    required this.shortDescription,
    required this.rating,
    required this.duration,
    required this.description,
    required this.portion,
    required this.spicyLevel,
    required this.ingredients,
    required this.category,
  });
}
