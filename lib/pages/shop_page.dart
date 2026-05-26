import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakertute/models/shoe.dart';
import '../components/shoe_tile.dart';
import 'package:sneakertute/models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //alert the user, shoe successfully added
    showDialog(
        context: context,
        builder: (contex) => AlertDialog(
              title: Text("Sucessfully added"),
              content: Text("Check your cart"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Search'),
                Icon(Icons.search, color: Colors.grey),
              ],
            ),
          ),

          // Message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Everyone flies... Some fly longer than others',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          // Hot picks label
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Expanded directly inside the outer Column — no nested Column
          Expanded(
            child: ListView.builder(
              itemCount: value.getShoeList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Shoe shoe = value.getShoeList()[index];
                //return the shoe
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeToCart(shoe),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Divider(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
