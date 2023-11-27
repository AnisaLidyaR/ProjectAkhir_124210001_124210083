import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'list.dart';

var boxName = 'MYLISTBOX';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter<MyList>(MyListAdapter());
  await Hive.openBox<MyList>(boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Mobile 124210001 & 124210083',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}