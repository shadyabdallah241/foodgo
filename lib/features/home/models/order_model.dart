import 'package:foodgo/features/home/models/burger.dart';


class OrderState {
  final Burger burger;
  final PortionSize portion;
  final double spicyLevel;
  final List<Ingredient> ingredients;

  const OrderState({
    required this.burger,
    required this.portion,
    required this.spicyLevel,
    required this.ingredients,
  });

  OrderState copyWith({
    Burger? burger,
    PortionSize? portion,
    double? spicyLevel,
    List<Ingredient>? ingredients,
  }) {
    return OrderState(
      burger: burger ?? this.burger,
      portion: portion ?? this.portion,
      spicyLevel: spicyLevel ?? this.spicyLevel,
      ingredients: ingredients ?? this.ingredients,
    );
  }
}
