import 'package:flutter/material.dart';

void main() {
  runApp(NetflixHomepage());
}

class NetflixHomepage extends StatefulWidget {
  @override
  _NetflixCloneAppState createState() => _NetflixCloneAppState();
}

class _NetflixCloneAppState extends State<NetflixHomepage> {
  int _selectedIndex = 0;

  final List<String> categories = ["Action", "Comedy", "Drama", "Sci-Fi", "Horror"];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Netflix',textAlign: TextAlign.center,style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24)),
        ),
        body: SingleChildScrollView(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Column( 
            children: [
              // section bagian atas brok plis jan ketuker lagi
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage('assets/top_movie.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Section kategori buat film
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Top Categories",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
                        label: Text(category, style: TextStyle(color: Colors.white)),
                      ),
                    );
                  }).toList(),
                ),
              ),

              // section pilem baru
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "New Movies",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
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
                      // detail info film
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
          ),],
          )
        ),
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
              icon: Icon(Icons.download),
              label: 'Downloads',
            ),
          ],
        ),
      ),
    );
  }
}
