import 'package:flutter/material.dart';

class living extends StatelessWidget {
  const living({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, size: 30, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.shopping_cart_outlined,
                  size: 35, color: Colors.black)),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.search_sharp,
                  size: 35, color: Colors.black)),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_sharp,
                      size: 35, color: Color(0xFF191C55))),
              const Text(
                "Living Room Furniture",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF191C55)),
              ),
              IconButton(
                  onPressed: () {
                   showModalBottomSheet(context: context, builder: (context) =>Column(children: [
                     const Text(
                       "Living Room Furniture",
                       style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.w400,
                           color: Color(0xFF191C55)),
                     ),
                     const Text(
                       "Living Room Furniture",
                       style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.w400,
                           color: Color(0xFF191C55)),
                     ),
                     IconButton(
                         onPressed: () {
                           Navigator.pop(context);
                         },
                         icon: const Icon(Icons.arrow_back_sharp,
                             size: 35, color: Color(0xFF191C55))),
                     const Text(
                       "Living Room Furniture",
                       style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.w400,
                           color: Color(0xFF191C55)),
                     ),
                     IconButton(
                         onPressed: () {
                           Navigator.pop(context);
                         },
                         icon: const Icon(Icons.add_chart,
                             size: 28, color: Color(0xFF191C55))),
                   ]) ,);
                  },
                  icon: const Icon(Icons.add_chart,
                      size: 28, color: Color(0xFF191C55))),
            ],
          )
        ],
      ),

    );
  }
}
