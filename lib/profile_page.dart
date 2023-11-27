import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _buildProfileCard(
              'assets/image/Livie.png',
              'Anisa Lidya Ramadani',
              '124210001',
              'Bontang, 02 Desember 2002',
              'Menonton film/drama',
            ),
            _buildProfileCard(
              'assets/image/Profile-1.jpg',
              'Fadhli Firda Artya Anugrah',
              '124210083',
              'Jakarta, 09 Maret 2003',
              'Main Game',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(
    String imagePath,
    String name,
    String nim,
    String birthPlace,
    String hobbies,
  ) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(height: 30),
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              nim,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              birthPlace,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              hobbies,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
