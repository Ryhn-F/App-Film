import 'package:flutter/material.dart';

void main() {
  runApp(Search());
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // list item yang bisa dicari -Marcell
  List<String> allItems = [
    "John Wick: Chapter 4",
    "Old Guard",
    "Civil War",
    "Without Remorse",
    "Zootopia 2",
    "13 Hours",
    "Triple 9",
    "Wraith Of Man",
    "Zootopia",
    "Toy Story 5"
  ];

  // list yang bakal ditampilin setelah pencarian -Marcell
  List<String> filteredItems = [];

  // controller untuk text field pencarian -Marcell (ilmu atp)
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = allItems; // menampilkan semua item pada awalnya -Marcell
  }

  // fungsi buat.... eh...untuk memfilter item berdasarkan teks pencarian, nah itu dia -Marcell
  void filterSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = allItems;
      } else {
        filteredItems = allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black, // set background belakang jadi warna nigga - Marcell
      appBar: AppBar(
        title: Text(
          'Search Page',
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Colors.black, // set warna app bar jadi item - Marcell
        actions: [
          // Variable buat Search Bar -Marcell
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (query) {
                  filterSearchResults(
                      query); // buat memfilter hasil pencarian -Marcell
                },
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              filteredItems[index],
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
