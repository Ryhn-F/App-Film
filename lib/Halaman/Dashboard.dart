import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'search.dart';
import 'akun.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NetflixHomepage(),
    );
  }
}

class NetflixHomepage extends StatefulWidget {
  const NetflixHomepage({super.key});

  @override
  _NetflixCloneState createState() => _NetflixCloneState();
}

class _NetflixCloneState extends State<NetflixHomepage> {
  int _selectedIndex = 0;
  final List<Widget> pages = [HomePage(), Search(), MyNetflixPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text('NETFLIX',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> categories = [
    "Action",
    "Comedy",
    "Romance",
    "Sci-Fi",
    "Horror",
    "Sports"
  ];
  final List<String> movies = ['Fast & Furious 9', 'Resort to Love'];
  final List<String> movieGenres = ['Action', 'Romance'];
  final List<String> movieImages = [
    'lib/Images/Wrath.png',
    'lib/Images/movie1.jpg'
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top View Carousel
            CarouselSlider(
              options: CarouselOptions(
                  height: 180, autoPlay: true, enlargeCenterPage: true),
              items: ['lib/Images/Carousel.jpg', 'lib/Images/Olala.jpg']
                  .map((imagePath) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(imagePath,
                      fit: BoxFit.cover, width: double.infinity),
                );
              }).toList(),
            ),

            const SizedBox(height: 10),

            // Top Categories
            Text("Top Categories",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 8.0),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.redAccent, width: 1.5),
                      ),
                      child: Text(category,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            // New Movies Section
            Text("New Movies",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),

            SizedBox(height: 8),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(movieImages[index],
                            fit: BoxFit.cover, width: double.infinity),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(movies[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(movieGenres[index],
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {},
                      child: Text("Watch now",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
