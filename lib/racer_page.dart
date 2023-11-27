import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Driver {
  final String givenName;
  final String familyName;
  final String dateOfBirth;
  final String nationality;
  final String url;

  Driver(this.givenName, this.familyName, this.dateOfBirth, this.nationality,
      this.url);

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      json['givenName'] as String,
      json['familyName'] as String,
      json['dateOfBirth'] as String,
      json['nationality'] as String,
      json['url'] as String,
    );
  }
}

class RacerPage extends StatelessWidget {
  Future<List<Driver>> _fetchDrivers() async {
    final response =
        await http.get(Uri.parse('https://ergast.com/api/f1/drivers.json'));

    if (response.statusCode == 200) {
      List<Driver> drivers = [];
      final jsonData = jsonDecode(response.body);

      for (var item in jsonData['MRData']['DriverTable']['Drivers']) {
        drivers.add(Driver.fromJson(item));
      }
      return drivers;
    } else {
      throw Exception('Failed to load drivers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('F1 Racers'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Driver>>(
          future: _fetchDrivers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return MenuCard(
                    title:
                        '${snapshot.data![index].givenName} ${snapshot.data![index].familyName}',
                    subtitle:
                        'Nationality: ${snapshot.data![index].nationality} | DOB: ${snapshot.data![index].dateOfBirth}',
                    url: snapshot.data![index].url,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String url;

  const MenuCard({
    required this.title,
    required this.subtitle,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(url),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
