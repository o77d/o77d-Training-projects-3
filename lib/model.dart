class DrinkModel {
  final String name;
  final String title;
  final String image;
  final String price;

  DrinkModel({
    required this.name,
    required this.title,
    required this.image,
    required this.price,
  });

static List<DrinkModel> drinks = [
    DrinkModel(
      name: 'Cappuccino',
      title: '20 flavors of cups.',
      image: 'assets/Banana.png',
      price: '\$3.50',
    ),
    DrinkModel(
      name: 'Latte',
      title: '20 flavors of cups.',
      image: 'assets/Brownie Island.png',
      price: '\$4.00',
    ),
    DrinkModel(
      name: 'Espresso',
      title: '20 flavors of cups.',
      image: 'assets/carmel.png',
      price: '\$2.50',
    ),
    DrinkModel(
      name: 'Mocha',
      title: '20 flavors of cups.',
      image: 'assets/Chocolate.png',
      price: '\$4.50',
    ),
    DrinkModel(
      name: 'Mocha',
      title: '20 flavors of cups.',
      image: 'assets/Peanut Butter.png',
      price: '\$4.50',
    ),
    DrinkModel(
      name: 'Mocha',
      title: '20 flavors of cups.',
      image: 'assets/Salted Caramel.png',
      price: '\$4.50',
    ),
    DrinkModel(
      name: 'Mocha',
      title: '20 flavors of cups.',
      image: 'assets/Strawberry.png',
      price: '\$4.50',
    ),
  ];










}