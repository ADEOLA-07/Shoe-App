import 'package:flutter/material.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(
                    'lib/images/nike.png',
                    height: 240,
                  ),
                ),

                const SizedBox(height: 48),
                //title
                const Text('Just Do It',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                const SizedBox(height: 24),
                //subtitle
                const Text(
                  'Brand new sneakers and custom kicks made with premium quality materials.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                //start now button
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      )),
                  // Handle button tap
                  child: Container(
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(25),
                      child: const Text(
                        'Shop Now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
