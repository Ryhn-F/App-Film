import 'package:flutter/material.dart';
import 'Dashboard.dart';

void main() {
  runApp(InfoWrath());
}

class InfoWrath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieDetailPage(),
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://awsimages.detik.net.id/community/media/visual/2021/05/08/1wrath-of-manfinal.jpeg?w=1200',
                    width: 300,
                    height: 450,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              'Wrath of Man',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'H is a mysterious man who starts working for a cash moving truck company. He becomes known for using amazing precision and dexterity to neutralise robbers. However, H is actually out for revenge.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Text(
              'Director: Guy Ritchie',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.check, size: 24, color: Colors.white),
                    SizedBox(height: 5),
                    Text('Remind Me',
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.thumb_up, size: 24, color: Colors.white),
                    SizedBox(height: 5),
                    Text('Rate',
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.share, size: 24, color: Colors.white),
                    SizedBox(height: 5),
                    Text('Share',
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'MORE LIKE THIS',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MovieItem(
                    imageUrl:
                        'https://m.media-amazon.com/images/M/MV5BNjcwN2Y0MGEtMjkyYy00YTYxLWFjMWItZTEyZjA1MTJhMjE2XkEyXkFqcGc@._V1_.jpg',
                    label: 'Recently Added',
                  ),
                  MovieItem(
                    imageUrl:
                        'https://m.media-amazon.com/images/S/pv-target-images/6d3d1461d50778271845ce7ec81ba2c5d76a20f7f84e5061cd099aabaedc77f9.jpg',
                    label: 'Recently Added',
                  ),
                  MovieItem(
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCJ3u0r_t4PXQntdqs_WkaSSncID7ubxKNBA&s',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String? label;

  MovieItem({required this.imageUrl, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 150,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 150,
              height: 225,
              fit: BoxFit.cover,
            ),
          ),
          if (label != null)
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Text(
                  label!,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
