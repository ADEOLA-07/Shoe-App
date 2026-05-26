import 'package:flutter/material.dart';
import 'shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Nike Air Max 270',
      price: '250',
      imagePath: 'lib/images/air max.jpg',
      description:
          'The Nike Air Max 270 features Nike\'s biggest heel Air unit yet for a super-soft ride that feels as impossible as it looks.',
    ),
    Shoe(
      name: 'Nike Air Force 1',
      price: '220',
      imagePath: 'lib/images/air force.jpg',
      description:
          'The Nike Air Force 1 is a classic basketball shoe that has become a cultural icon, known for its timeless design and comfort.',
    ),
    Shoe(
      name: 'Nike Air Jordan 1',
      price: '240',
      imagePath: 'lib/images/jordan 1.jpg',
      description:
          'The Nike Air Jordan 1 is the original signature shoe of basketball legend Michael Jordan, featuring a high-top design and iconic colorways.',
    ),
    Shoe(
      name: 'Nike Dunk Low',
      price: '200',
      imagePath: 'lib/images/dunk low.jpg',
      description:
          'The Nike Dunk Low is a versatile sneaker that combines style and comfort, making it a popular choice for both athletes and sneaker enthusiasts.',
    ),
  ];
  //list of items in cart
  List<Shoe> userCart = [];
  // get list of items for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

  // get cart total
  double getTotal() {
    double total = 0;
    for (var shoe in userCart) {
      total += double.parse(shoe.price);
    }
    return total;
  }

  // clear cart
  void clearCart() {
    userCart.clear();
    notifyListeners();
  }
}
