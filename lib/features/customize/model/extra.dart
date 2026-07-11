class Extras {
  final String id;
  final String name;
  final String image;
  final bool isChecked;

  const Extras({
    required this.id,
    required this.name,
    required this.image,
    required this.isChecked,
  });
}

List<Extras> toppings = [
  Extras(
    id: "topping_tomato",
    name: "Tomato",
    image: "assets/images/tomato.png",
    isChecked: false,
  ),
  Extras(
    id: "topping_onion",
    name: "Onion",
    image: "assets/images/onion.png",
    isChecked: false,
  ),
  Extras(
    id: "topping_pickles",
    name: "Pickles",
    image: "assets/images/pickles.png",
    isChecked: false,
  ),
  Extras(
    id: "topping_bacons",
    name: "Bacons",
    image: "assets/images/bacons.png",
    isChecked: false,
  ),


];
List<Extras> sideOptions = [
  Extras(
    id: "1",
    name: "Fries",
    image: "assets/images/fries.png",
    isChecked: false,
  ),
  Extras(
    id: "2",
    name: "Coleslaw",
    image: "assets/images/coleslaw.png",
    isChecked: false,
  ),
  Extras(
    id: "3",
    name: "Salad",
    image: "assets/images/salad.png",
    isChecked: false,
  ),
  Extras(
    id: "4",
    name: "Onion",
    image: "assets/images/fried_onion.png",
    isChecked: false,
  ),

];
