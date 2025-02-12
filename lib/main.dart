import 'package:flutter/material.dart';
import 'package:netflix_app/Controller/loginController.dart';
import 'package:netflix_app/Halaman/Dashboard.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:netflix_app/models/userModel.dart';
import 'package:provider/provider.dart';
import 'Login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('users');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController()),
      ],
      child: const NetflixLoginApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NetflixLoginApp(),
    );
  }
}
