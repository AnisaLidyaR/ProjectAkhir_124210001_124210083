import 'package:flutter/material.dart';
import 'package:projectpam_01_83/konversi_mata_uang_page.dart';
import 'package:projectpam_01_83/login_page.dart';
import 'package:projectpam_01_83/my_list_page.dart';
import 'package:projectpam_01_83/profile_page.dart';
import 'package:projectpam_01_83/racer_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          MenuCard(title: 'List F1 Racer', nextPage: RacerPage()),
          MenuCard(title: 'My List', nextPage: MyListPage()),
          MenuCard(title: 'Currency Converter ', nextPage: CurrencyConverter()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Logout',
            ),
          ],
          selectedItemColor: Colors.deepPurple[300],
          unselectedItemColor: Colors.black,
          // Warna label yang tidak dipilih
          selectedLabelStyle: TextStyle(color: Colors.black),
          // Gaya teks label yang dipilih
          unselectedLabelStyle: TextStyle(color: Colors.black),
          onTap: (int index) {
            switch (index) {
              case 0:
              // Navigasi ke halaman utama
                break;
              case 1:
              // Navigasi ke halaman saran & kesan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
                break;
              case 2:
              // Navigasi ke halaman profile
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                break;
            }
          }),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final Widget nextPage;

  const MenuCard({Key? key, required this.title, required this.nextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Container(
          height: 100,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
