import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Netflix',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
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
  const MyNetflixPage({super.key});

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
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqYw6fD4IbN_JQlaq2U1iwZbwvJqggNuE_Pg&s',
                                  ),
                                  backgroundColor: Colors.grey[800],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Raycell',
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

                          SectionHeader(
                              icon: Icons.notifications,
                              title: 'Notifications',
                              onTap: () {}),
                          NotificationItem(
                            imageUrl:
                                'https://upload.wikimedia.org/wikipedia/id/0/0d/Civil_War_2024_film_poster.jpeg',
                            title: 'Reminder: Now Available - Civil War',
                            subtitle: 'Live Episode',
                            date: '11 Jan',
                          ),
                          NotificationItem(
                            imageUrl:
                                'https://upload.wikimedia.org/wikipedia/en/6/6a/Zootopia_2_%282025_film%29.jpg',
                            title: 'Zootopia 2',
                            subtitle: 'Coming Soon',
                            date: '9 Dec',
                          ),
                          SizedBox(height: 24),

                          SectionHeader(
                              icon: Icons.person,
                              title: 'Account',
                              onTap: () {}),
                          SizedBox(height: 24),

                          SectionHeader(
                              title: 'My List',
                              actionText: 'See All',
                              onTap: () {}),
                          SizedBox(
                            height: 12,
                          ),
                          HorizontalList(
                            items: [
                              ListItem(
                                imageUrl:
                                    'https://m.media-amazon.com/images/S/pv-target-images/6d3d1461d50778271845ce7ec81ba2c5d76a20f7f84e5061cd099aabaedc77f9.jpg',
                                label: 'John Wick: Chapter 4',
                              ),
                              ListItem(
                                imageUrl:
                                    'https://media.discordapp.net/attachments/1279079143224512615/1338917060998336582/p18035013_v_v12_ai.png?ex=67acd32f&is=67ab81af&hm=b69822ad0fb97bf205f65923d495b3ae152315314c229bd92cfeb10b05d14fa4&=&format=webp&quality=lossless&width=264&height=396',
                                label: 'Without Remorse',
                              ),
                              ListItem(
                                imageUrl:
                                    'https://media.discordapp.net/attachments/1279079143224512615/1338917666735263914/MV5BNjcwN2Y0MGEtMjkyYy00YTYxLWFjMWItZTEyZjA1MTJhMjE2XkEyXkFqcGc.png?ex=67acd3bf&is=67ab823f&hm=dd7cd4159fb60857b4112dd4d69db94cea7a1ccd6ef6bd4bf6ddfa86af0af271&=&format=webp&quality=lossless&width=472&height=700',
                                label: 'Old Guard',
                              ),
                            ],
                          ),
                          SizedBox(height: 24),

                          SectionHeader(title: "Trailers You've Watched"),
                          HorizontalList(
                            items: [
                              ListItem2(
                                imageUrl:
                                    'https://media.discordapp.net/attachments/1279079143224512615/1338917739401580646/film-13-hours.png?ex=67acd3d0&is=67ab8250&hm=841231b08d2bb36d34354fd5d7a2db252598d037917b3ed1bdc88fa9cd918d83&=&format=webp&quality=lossless&width=279&height=420',
                                label: '13 Hours',
                              ),
                              ListItem2(
                                imageUrl:
                                    'https://media.discordapp.net/attachments/1279079143224512615/1338917992523763793/QnnFIt4bBj0XEHM-3Fr8CegLotZ4iSfQ67lEksvc721dtmEhwOenrCVcxVrCLs23r6RQ.png?ex=67acd40d&is=67ab828d&hm=2619ec30756b5d4ada0915af098a58a405e9c80e18a1c4c727ca154c6421c08d&=&format=webp&quality=lossless&width=427&height=614',
                                label: 'Triple 9',
                              ),
                              ListItem2(
                                imageUrl:
                                    'https://media.discordapp.net/attachments/1279079143224512615/1338918476818944080/002546800_1620625209-Wrath_of_Man_0.png?ex=67acd480&is=67ab8300&hm=8d2a5b7a7e8c0a7f3319bb0cc43ecd5af2ffdb66bfb950c61af4ef322449cc4b&=&format=webp&quality=lossless&width=315&height=420',
                                label: 'Wraith Of Man',
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

class SectionHeader extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? actionText;
  final VoidCallback? onTap;

  const SectionHeader({
    super.key,
    this.icon,
    required this.title,
    this.actionText,
    this.onTap,
  });

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
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 80,
              height: 80,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image, color: Colors.redAccent, size: 80),
              ),
            ),
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

  const HorizontalList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: items),
    );
  }
}

class ListItem2 extends StatelessWidget {
  final String imageUrl;
  final String label;

  const ListItem2({
    super.key,
    required this.imageUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 100,
              height: 150,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.broken_image,
                    color: Colors.redAccent,
                    size: 100),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                label!,
                style:
                    TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
              ),
              Text(
                'Recently Watched',
                style: TextStyle(color: const Color.fromARGB(255, 236, 16, 16)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String imageUrl;
  final String? label;

  const ListItem({super.key, required this.imageUrl, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 100,
              height: 150,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.broken_image,
                    color: Colors.redAccent,
                    size: 100),
              ),
            ),
          ),
          if (label != null)
            Column(
              children: [
                Text(
                  label!,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                Text(
                  'Recently Added',
                  style:
                      TextStyle(color: const Color.fromARGB(255, 236, 16, 16)),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
