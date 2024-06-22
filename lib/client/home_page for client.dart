import 'package:flutter/material.dart';
import 'package:pr1/Drawer/drawer_user.dart';

class homePageClient extends StatefulWidget {
  const homePageClient({super.key});

  @override
  State<homePageClient> createState() => _homePageClientState();
}

class _homePageClientState extends State<homePageClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 350,
                    width: double.infinity,
                    child: const Image(
                      image: AssetImage("assets/about.png"),
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  right: 0,
                  top: 0,
                  left: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image(
                              image: AssetImage("assets/logomin.png"),
                              height: 80,
                              width: 44),
                          Text(
                            'Home',
                            style: TextStyle(fontSize: 12, color: Colors.amber),
                          ),
                          Text(
                            'About Us',
                            style: TextStyle(fontSize: 12, color: Colors.amber),
                          ),
                          Text(
                            'Contact us',
                            style: TextStyle(fontSize: 12, color: Colors.amber),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffc58a00),
                                      // border: 3px solid rgba(210, 171, 69, 1)// Change border color here
                                      width: 1, // Set border width
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: const Text(
                                    "signup",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.amber),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffc58a00),
                                      // border: 3px solid rgba(210, 171, 69, 1)// Change border color here
                                      width: 1, // Set border width
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    "login",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.amber),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Center(
                        child: Text(
                          "brining  Your  Dream Home \n"
                          "                    To Life ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(2),
                        child: Center(
                          child: Text(
                            "Turn your room with A2Z into a lot more minimalist\n"
                            "                 and modern with ease and speed ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            DefaultTabController(
              length: 2,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: const Color(0xFF0C134D),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: 'Design',
                    ),
                    Tab(
                      text: 'Store',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Discover the Latest Furniture Trends",
                  style: TextStyle(fontSize: 18)),
            ),
            Text("Shop the Latest Fashion Items and\n"
                "       Stay ahead of the style game"),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: const Image(
                            image: AssetImage("assets/Rectangle 1.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          child: Image(
                            image: AssetImage("assets/Rectangle 1.png"),
                            fit: BoxFit.fill,
                          ),
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: const Image(
                    image: AssetImage("assets/Rectangle 4.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF0C134D),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          "Explore More --->",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                 // DefaultTabController(
                 //    length: 5,
                 //    //initialIndex: 0,
                 //    child: Column(
                 //      children: [
                 //        Expanded(
                 //          child: TabBar(
                 //            //controller: tabController,
                 //            isScrollable: true,
                 //            indicator: BoxDecoration(
                 //              borderRadius: BorderRadius.circular(
                 //                23.0,
                 //              ),
                 //              color: const Color(0xFF0C134D),
                 //            ),
                 //            labelColor: Colors.white,
                 //            unselectedLabelColor: Colors.black,
                 //            tabs: [
                 //              Tab(
                 //                text: 'bedRooms',
                 //              ),
                 //              Tab(
                 //                text: 'leaving',
                 //              ),
                 //              Tab(
                 //                text: 'Home office',
                 //              ),
                 //              Tab(
                 //                text: 'Home office',
                 //              ),
                 //              Tab(
                 //                text: 'Home office',
                 //              ),
                 //            ],
                 //          ),
                 //        ),
                 //        Expanded(
                 //          child:
                 //          TabBarView(
                 //            children: [
                 //              GridView.builder(
                 //                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 //                  crossAxisCount: 2,
                 //                  crossAxisSpacing: 10.0,
                 //                  mainAxisSpacing: 10.0,
                 //                  childAspectRatio: 0.7,
                 //                ),
                 //                itemCount: 4,
                 //                itemBuilder: (context, index) {
                 //                  return Card(
                 //                    shape: RoundedRectangleBorder(
                 //                      borderRadius: BorderRadius.circular(16.0),
                 //                    ),
                 //                    child: Column(
                 //                      crossAxisAlignment: CrossAxisAlignment.start,
                 //                      children: [
                 //                        ClipRRect(
                 //                          borderRadius: BorderRadius.only(
                 //                            topLeft: Radius.circular(16.0),
                 //                            topRight: Radius.circular(16.0),
                 //                          ),
                 //                          child: Image.asset("assets/2681826 1.png",
                 //                              fit: BoxFit.cover,
                 //                              height: 150,
                 //                              width: double.infinity),
                 //                        ),
                 //                        const SizedBox(height: 8),
                 //                        Padding(
                 //                          padding:
                 //                          const EdgeInsets.symmetric(horizontal: 8.0),
                 //                          child: Text("title",
                 //                              style: const TextStyle(fontSize: 12)),
                 //                        ),
                 //                        const SizedBox(height: 4),
                 //                        Row(
                 //                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 //                          children: [
                 //                            Text('\$price',
                 //                                style: const TextStyle(
                 //                                    fontSize: 14,
                 //                                    fontWeight: FontWeight.bold)),
                 //                            ElevatedButton(
                 //                              onPressed: () {},
                 //                              style: ElevatedButton.styleFrom(
                 //                                backgroundColor: Colors.blue.shade100,
                 //                                shape: RoundedRectangleBorder(
                 //                                  borderRadius: BorderRadius.circular(20.0),
                 //                                ),
                 //                                padding: const EdgeInsets.symmetric(
                 //                                    horizontal: 10, vertical: 6),
                 //                              ),
                 //                              child: const Text(
                 //                                'Add to Cart',
                 //                                style: TextStyle(
                 //                                    fontSize: 14, color: Colors.blue),
                 //                              ),
                 //                            ),
                 //                          ],
                 //                        )
                 //                      ],
                 //                    ),
                 //                  );
                 //                },
                 //              ),
                 //              GridView.builder(
                 //                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 //                  crossAxisCount: 2,
                 //                  crossAxisSpacing: 10.0,
                 //                  mainAxisSpacing: 10.0,
                 //                  childAspectRatio: 0.7,
                 //                ),
                 //                itemCount: 4,
                 //                itemBuilder: (context, index) {
                 //                  return Card(
                 //                    shape: RoundedRectangleBorder(
                 //                      borderRadius: BorderRadius.circular(16.0),
                 //                    ),
                 //                    child: Column(
                 //                      crossAxisAlignment: CrossAxisAlignment.start,
                 //                      children: [
                 //                        ClipRRect(
                 //                          borderRadius: BorderRadius.only(
                 //                            topLeft: Radius.circular(16.0),
                 //                            topRight: Radius.circular(16.0),
                 //                          ),
                 //                          child: Image.asset("assets/2681826 1.png",
                 //                              fit: BoxFit.cover,
                 //                              height: 150,
                 //                              width: double.infinity),
                 //                        ),
                 //                        const SizedBox(height: 8),
                 //                        Padding(
                 //                          padding:
                 //                          const EdgeInsets.symmetric(horizontal: 8.0),
                 //                          child: Text("title",
                 //                              style: const TextStyle(fontSize: 12)),
                 //                        ),
                 //                        const SizedBox(height: 4),
                 //                        Row(
                 //                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 //                          children: [
                 //                            Text('\$price',
                 //                                style: const TextStyle(
                 //                                    fontSize: 14,
                 //                                    fontWeight: FontWeight.bold)),
                 //                            ElevatedButton(
                 //                              onPressed: () {},
                 //                              style: ElevatedButton.styleFrom(
                 //                                backgroundColor: Colors.blue.shade100,
                 //                                shape: RoundedRectangleBorder(
                 //                                  borderRadius: BorderRadius.circular(20.0),
                 //                                ),
                 //                                padding: const EdgeInsets.symmetric(
                 //                                    horizontal: 10, vertical: 6),
                 //                              ),
                 //                              child: const Text(
                 //                                'Add to Cart',
                 //                                style: TextStyle(
                 //                                    fontSize: 14, color: Colors.blue),
                 //                              ),
                 //                            ),
                 //                          ],
                 //                        )
                 //                      ],
                 //                    ),
                 //                  );
                 //                },
                 //              ),
                 //              GridView.builder(
                 //                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 //                  crossAxisCount: 2,
                 //                  crossAxisSpacing: 10.0,
                 //                  mainAxisSpacing: 10.0,
                 //                  childAspectRatio: 0.7,
                 //                ),
                 //                itemCount: 4,
                 //                itemBuilder: (context, index) {
                 //                  return Card(
                 //                    shape: RoundedRectangleBorder(
                 //                      borderRadius: BorderRadius.circular(16.0),
                 //                    ),
                 //                    child: Column(
                 //                      crossAxisAlignment: CrossAxisAlignment.start,
                 //                      children: [
                 //                        ClipRRect(
                 //                          borderRadius: BorderRadius.only(
                 //                            topLeft: Radius.circular(16.0),
                 //                            topRight: Radius.circular(16.0),
                 //                          ),
                 //                          child: Image.asset("assets/2681826 1.png",
                 //                              fit: BoxFit.cover,
                 //                              height: 150,
                 //                              width: double.infinity),
                 //                        ),
                 //                        const SizedBox(height: 8),
                 //                        Padding(
                 //                          padding:
                 //                          const EdgeInsets.symmetric(horizontal: 8.0),
                 //                          child: Text("title",
                 //                              style: const TextStyle(fontSize: 12)),
                 //                        ),
                 //                        const SizedBox(height: 4),
                 //                        Row(
                 //                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 //                          children: [
                 //                            Text('\$price',
                 //                                style: const TextStyle(
                 //                                    fontSize: 14,
                 //                                    fontWeight: FontWeight.bold)),
                 //                            ElevatedButton(
                 //                              onPressed: () {},
                 //                              style: ElevatedButton.styleFrom(
                 //                                backgroundColor: Colors.blue.shade100,
                 //                                shape: RoundedRectangleBorder(
                 //                                  borderRadius: BorderRadius.circular(20.0),
                 //                                ),
                 //                                padding: const EdgeInsets.symmetric(
                 //                                    horizontal: 10, vertical: 6),
                 //                              ),
                 //                              child: const Text(
                 //                                'Add to Cart',
                 //                                style: TextStyle(
                 //                                    fontSize: 14, color: Colors.blue),
                 //                              ),
                 //                            ),
                 //                          ],
                 //                        )
                 //                      ],
                 //                    ),
                 //                  );
                 //                },
                 //              ),
                 //              GridView.builder(
                 //                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 //                  crossAxisCount: 2,
                 //                  crossAxisSpacing: 10.0,
                 //                  mainAxisSpacing: 10.0,
                 //                  childAspectRatio: 0.7,
                 //                ),
                 //                itemCount: 4,
                 //                itemBuilder: (context, index) {
                 //                  return Card(
                 //                    shape: RoundedRectangleBorder(
                 //                      borderRadius: BorderRadius.circular(16.0),
                 //                    ),
                 //                    child: Column(
                 //                      crossAxisAlignment: CrossAxisAlignment.start,
                 //                      children: [
                 //                        ClipRRect(
                 //                          borderRadius: BorderRadius.only(
                 //                            topLeft: Radius.circular(16.0),
                 //                            topRight: Radius.circular(16.0),
                 //                          ),
                 //                          child: Image.asset("assets/2681826 1.png",
                 //                              fit: BoxFit.cover,
                 //                              height: 150,
                 //                              width: double.infinity),
                 //                        ),
                 //                        const SizedBox(height: 8),
                 //                        Padding(
                 //                          padding:
                 //                          const EdgeInsets.symmetric(horizontal: 8.0),
                 //                          child: Text("title",
                 //                              style: const TextStyle(fontSize: 12)),
                 //                        ),
                 //                        const SizedBox(height: 4),
                 //                        Row(
                 //                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 //                          children: [
                 //                            Text('\$price',
                 //                                style: const TextStyle(
                 //                                    fontSize: 14,
                 //                                    fontWeight: FontWeight.bold)),
                 //                            ElevatedButton(
                 //                              onPressed: () {},
                 //                              style: ElevatedButton.styleFrom(
                 //                                backgroundColor: Colors.blue.shade100,
                 //                                shape: RoundedRectangleBorder(
                 //                                  borderRadius: BorderRadius.circular(20.0),
                 //                                ),
                 //                                padding: const EdgeInsets.symmetric(
                 //                                    horizontal: 10, vertical: 6),
                 //                              ),
                 //                              child: const Text(
                 //                                'Add to Cart',
                 //                                style: TextStyle(
                 //                                    fontSize: 14, color: Colors.blue),
                 //                              ),
                 //                            ),
                 //                          ],
                 //                        )
                 //                      ],
                 //                    ),
                 //                  );
                 //                },
                 //              ),
                 //              GridView.builder(
                 //                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 //                  crossAxisCount: 2,
                 //                  crossAxisSpacing: 10.0,
                 //                  mainAxisSpacing: 10.0,
                 //                  childAspectRatio: 0.7,
                 //                ),
                 //                itemCount: 4,
                 //                itemBuilder: (context, index) {
                 //                  return Card(
                 //                    shape: RoundedRectangleBorder(
                 //                      borderRadius: BorderRadius.circular(16.0),
                 //                    ),
                 //                    child: Column(
                 //                      crossAxisAlignment: CrossAxisAlignment.start,
                 //                      children: [
                 //                        ClipRRect(
                 //                          borderRadius: BorderRadius.only(
                 //                            topLeft: Radius.circular(16.0),
                 //                            topRight: Radius.circular(16.0),
                 //                          ),
                 //                          child: Image.asset("assets/2681826 1.png",
                 //                              fit: BoxFit.cover,
                 //                              height: 150,
                 //                              width: double.infinity),
                 //                        ),
                 //                        const SizedBox(height: 8),
                 //                        Padding(
                 //                          padding:
                 //                          const EdgeInsets.symmetric(horizontal: 8.0),
                 //                          child: Text("title",
                 //                              style: const TextStyle(fontSize: 12)),
                 //                        ),
                 //                        const SizedBox(height: 4),
                 //                        Row(
                 //                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 //                          children: [
                 //                            Text('\$price',
                 //                                style: const TextStyle(
                 //                                    fontSize: 14,
                 //                                    fontWeight: FontWeight.bold)),
                 //                            ElevatedButton(
                 //                              onPressed: () {},
                 //                              style: ElevatedButton.styleFrom(
                 //                                backgroundColor: Colors.blue.shade100,
                 //                                shape: RoundedRectangleBorder(
                 //                                  borderRadius: BorderRadius.circular(20.0),
                 //                                ),
                 //                                padding: const EdgeInsets.symmetric(
                 //                                    horizontal: 10, vertical: 6),
                 //                              ),
                 //                              child: const Text(
                 //                                'Add to Cart',
                 //                                style: TextStyle(
                 //                                    fontSize: 14, color: Colors.blue),
                 //                              ),
                 //                            ),
                 //                          ],
                 //                        )
                 //                      ],
                 //                    ),
                 //                  );
                 //                },
                 //              ),
                 //            ],
                 //            // controller: _tabController,
                 //          ),
                 //        ),
                 //      ],
                 //    ),
                 //  ),




                const SizedBox(
                  height: 10,
                ),
                const Text("Furniture",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                const Text("Discover the Latest Trends",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text("Stay updated with our information and engaging\n"
                    "     blog posts about modern Furniture and \n"
                    "                  Fashion on the industry")
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      drawer: const drawerClient(),
    );
  }
}
