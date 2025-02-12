import 'package:flutter/material.dart';
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

  final List<Widget> pages = [
    HomePage(),
    Search(),
    MyNetflixPage(),
  ];

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
            'Netflix',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: pages[
          _selectedIndex], // Tampilkan halaman sesuai indeks yang dipilih -Marcell
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> categories = [
    "Action",
    "Comedy",
    "Drama",
    "Sci-Fi",
    "Horror"
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Section bagian atas -Marcell
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage("lib/Images/Olala.jpg"), //GAMBAR GAK MUNCUL
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Section kategori film- Marcell
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Top Categories",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Chip(
                    backgroundColor: Colors.redAccent,
                    label:
                        Text(category, style: TextStyle(color: Colors.white)),
                  ),
                );
              }).toList(),
            ),
          ),
          // Section film baru -Marcell
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "New Movies",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8), // jarak new movies sama poto -Marcell
          Image.asset(
            'lib/Images/Olala.jpg', //YANG INI JUGA GAK MUNCUL ANJIRRRRRRRRRRRRRR
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: List.generate(4, (index) {
              return GestureDetector(
                onTap: () {
                  // detail info film -Marcell
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage('assets/movie_$index.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
