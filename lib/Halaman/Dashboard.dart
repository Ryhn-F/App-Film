import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'search.dart';
import 'akun.dart';
import 'Info.dart';
import 'Info2.dart';

void main() {
  runApp(Dashboard());
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
          child: Text(
            'NETFLIX',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
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

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = [
    "Action",
    "Comedy",
    "Romance",
    "Sci-Fi",
    "Horror",
    "Sports"
  ];
  final List<String> movies = [
    'Wrath of Man',
    '13 Hours: The Secret Soldiers of Benghazi'
  ];
  final List<String> movieGenres = ['Action, Crime, Thriller', 'Action, War'];
  final List<String> movieImages = [
    'lib/Images/Wrath.png',
    'lib/Images/Hours.png'
  ];

  // Define movie detail screens
  final List<Widget> moviesDetail = [InfoWrath(), InfoHours()];

  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 180, autoPlay: true, enlargeCenterPage: true),
              items: [
                'lib/Images/Carousel.jpg',
                'lib/Images/Carousel2.jpg',
                'lib/Images/Batman.jpg',
              ].map((imagePath) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(imagePath,
                      fit: BoxFit.cover, width: double.infinity),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Text("Top Categories",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.asMap().entries.map((entry) {
                  int index = entry.key;
                  String category = entry.value;
                  return MouseRegion(
                    onEnter: (_) => setState(() => hoveredIndex = index),
                    onExit: (_) => setState(() => hoveredIndex = null),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      margin:
                          EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: hoveredIndex == index
                            ? Colors.red.withOpacity(0.8)
                            : Colors.grey[900],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.red, width: 1.5),
                        boxShadow: hoveredIndex == index
                            ? [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                )
                              ]
                            : [],
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
            Text("New Movies",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.5,
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
                          style:
                              TextStyle(color: Colors.white70, fontSize: 12)),
                      SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          // Navigate to the correct movie detail based on the index
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => moviesDetail[
                                    index]), // Passing the correct page
                          );
                        },
                        child: Text("Watch now",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
