abstract class Ingredient {
  final String name;
  Ingredient(this.name);
}

class Onion extends Ingredient {
  Onion(super.name);
}

class BeefPatty extends Ingredient {
  BeefPatty(super.name);
}

class Cheese extends Ingredient {
  Cheese(super.name);
}

class BurgerBuilder {
  late Burger _newBurger;
  BurgerBuilder() {
    _newBurger = Burger([]);
  }

  void addBeefPatty() {
    _newBurger.ingredient.add(BeefPatty('BeefPatty'));
  }

  void addOnion() {
    _newBurger.ingredient.add(Onion('Onion'));
  }

  void addCheese() {
    _newBurger.ingredient.add(Cheese('Cheese'));
  }

  Burger createBurger() {
    return _newBurger;
  }
}

class Burger {
  final List<Ingredient> ingredient;
  Burger(this.ingredient);
}

void application() {
  final burgerBuilder = BurgerBuilder();
  burgerBuilder.addBeefPatty();
  burgerBuilder.addCheese();
  burgerBuilder.addOnion();
  Burger myBurger = burgerBuilder.createBurger();
}
