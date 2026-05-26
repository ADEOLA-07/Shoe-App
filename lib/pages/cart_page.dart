import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/cart_item.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //heading
              const Text(
                'My Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),

              const SizedBox(height: 20),

              Expanded(
                  child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  // get individual Shoe
                  Shoe individualShoe = value.getUserCart()[index];

                  //return the cart list
                  return CartItem(shoe: individualShoe);
                },
              )),
              // Total Summary at the bottom
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '\$${value.getTotal().toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: value.getUserCart().isEmpty
                      ? null
                      : () {
                          //clear cart
                          Provider.of<Cart>(context, listen: false).clearCart();

                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Order Placed'),
                              content: const Text(
                                  'Your order has been placed successfully!'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
