import 'package:foodgo/core/constants/app_images.dart';
import 'package:foodgo/features/home/models/burger.dart';

List<Burger> burgers = [
  Burger(
    id: "0",
    image: AppImages.cheeseburger,
    name: "Cheeseburger",
    shortDescription: "Wendy's Burger",
    rating: 4.9,
  ),
  Burger(
    id: "1",
    image: AppImages.veggieBurger,
    name: "Hamburger Veggie",
    shortDescription: "Veggie Burger",
    rating: 4.8,
  ),
  Burger(
    id: "2",
    image: AppImages.chickenBurger,
    name: "Chicken Hamburger",
    shortDescription: "Chicken Burger",
    rating: 4.6,
  ),
  Burger(
    id: "3",
    image: AppImages.friedChicken,
    name: "Hamburger",
    shortDescription: "Fried Chicken Burger",
    rating: 4.5,
  ),
];
