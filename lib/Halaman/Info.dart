import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _DashboardState();
}

class _DashboardState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "flutter bejir", //INI BUAT DESKRIPSI FILM NYA GIMANA CUK, GAK ADA KABAR ANJER.. gw cariin juga -Marcell
        style: TextStyle( //gw dah buat fungsi/variable nya di dashboard coba cek aja, masalahnya gw bingung gimana jadinya jir, kalo ngikutin mock up
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
