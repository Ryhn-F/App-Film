import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Netflix',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor:
            Colors.black, // Ensures background is fully black
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: MyNetflixPage(),
    );
  }
}

class MyNetflixPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: SizedBox.expand(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          // Profile Section
                          Center(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                    'https://storage.googleapis.com/a1aa/image/yTjOIYdz_bAEHGY-mWHBCmRlDDSDw8PrRL7ryMRj0Ek.jpg',
                                  ),
                                  backgroundColor: Colors.grey[800],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('2',
                                        style: TextStyle(
                                            fontSize: 24, color: Colors.white)),
                                    Icon(Icons.arrow_drop_down,
                                        color: Colors.white),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),

                          // Notifications Section
                          SectionHeader(
                              icon: Icons.notifications,
                              title: 'Notifications',
                              onTap: () {}),
                          NotificationItem(
                            imageUrl:
                                'https://storage.googleapis.com/a1aa/image/melHozz6glZUebkxgCSX0wZstu053N1Ox4Iu1QGlou8.jpg',
                            title: 'Reminder: Now Available',
                            subtitle: 'Live Episode',
                            date: '11 Jan',
                          ),
                          NotificationItem(
                            imageUrl:
                                'https://storage.googleapis.com/a1aa/image/CBCgJTdBNm8OucUOWMQs27dzm8N1XwFDR8RFV0HECq0.jpg',
                            title: 'Just checking in...',
                            subtitle: 'Enjoying Thaghut?',
                            date: '9 Jan',
                          ),
                          SizedBox(height: 24),

                          // Downloads Section
                          SectionHeader(
                              icon: Icons.download,
                              title: 'Downloads',
                              onTap: () {}),
                          SizedBox(height: 24),

                          // My List Section
                          SectionHeader(
                              title: 'My List',
                              actionText: 'See All',
                              onTap: () {}),
                          HorizontalList(
                            items: [
                              ListItem(
                                imageUrl:
                                    'https://storage.googleapis.com/a1aa/image/_WXMZCoAy6Tn8Ur_jJseAJ2DBqDwRlsNlN1Xa5xGkAo.jpg',
                                label: 'Recently Added',
                              ),
                              ListItem(
                                imageUrl:
                                    'https://storage.googleapis.com/a1aa/image/PaTHtTHe1mZsNGOAe8f1HZTL2iNI8JomBzB9jnFh2QU.jpg',
                              ),
                              ListItem(
                                imageUrl:
                                    'https://storage.googleapis.com/a1aa/image/zUL8t07GBUzqpyrzBQuQqc0fje02cVXQE0HaW5YKMxI.jpg',
                                label: 'Live',
                              ),
                            ],
                          ),
                          SizedBox(height: 24),

                          // Trailers You've Watched Section
                          SectionHeader(title: "Trailers You've Watched"),
                          HorizontalList(
                            items: [
                              ListItem(
                                imageUrl:
                                    'https://storage.googleapis.com/a1aa/image/IEoNWTf-ms8Hi2gvukGnaS8Yd8f3rwP1I8hKDYMYQw8.jpg',
                              ),
                              ListItem(
                                imageUrl:
                                    'https://storage.googleapis.com/a1aa/image/-8HswXvBeCkdcx-VtWwh2fmwoGVP835n5aYoibEr59Q.jpg',
                              ),
                              ListItem(
                                imageUrl:
                                    'https://storage.googleapis.com/a1aa/image/g_GVv5Ol_GwAAbcqAZ7LfnDV2Cmi44WnsZYnqFxoKr0.jpg',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

// -----------------
// UI Components
// -----------------
class SectionHeader extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? actionText;
  final VoidCallback? onTap;

  const SectionHeader({
    Key? key,
    this.icon,
    required this.title,
    this.actionText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (icon != null) Icon(icon, color: Colors.red, size: 28),
            if (icon != null) SizedBox(width: 8),
            Text(title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
        if (actionText != null)
          GestureDetector(
            onTap: onTap,
            child: Text(actionText!, style: TextStyle(color: Colors.redAccent)),
          ),
      ],
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String date;

  const NotificationItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.broken_image, color: Colors.redAccent, size: 80),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              Text(subtitle, style: TextStyle(color: Colors.white70)),
              Text(date, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  final List<Widget> items;

  const HorizontalList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: items),
    );
  }
}

class ListItem extends StatelessWidget {
  final String imageUrl;
  final String? label;

  const ListItem({Key? key, required this.imageUrl, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: 100,
            height: 150,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.broken_image, color: Colors.redAccent, size: 100),
          ),
          if (label != null)
            Text(label!, style: TextStyle(color: Colors.redAccent)),
        ],
      ),
    );
  }
}
