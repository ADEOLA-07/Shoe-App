import 'package:flutter/material.dart';
import 'package:sneakertute/components/bottom_nav_bar.dart';
import 'package:sneakertute/pages/cart_page.dart';
import 'package:sneakertute/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //this selected index is to contol the bottom nav bar
  int selectedIndex = 0;

  //this function is to navigate the bottom nav bar
  //when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  //pages to display
  final List<Widget> _pages = [
    // shop page
    const ShopPage(),
    //cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        leading: Builder(
            builder: (context) => IconButton(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Scaffold.of(context)
                        .openDrawer(); // Handle menu button press
                  },
                )),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    'lib/images/nike-logo-49340.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(color: Colors.grey[800]),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text(
                      'Info',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[selectedIndex],
    );
  }
}
