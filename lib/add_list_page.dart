import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'main.dart';
import 'list.dart';

class AddMyList extends StatefulWidget {
  const AddMyList({super.key});

  @override
  State<AddMyList> createState() => _AddMyListState();
}

class _AddMyListState extends State<AddMyList> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add My List'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Title',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: 'Description',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              var newMyList = MyList(
                name: nameController.text,
                description: descriptionController.text,
              );

              Hive.box<MyList>(boxName).add(newMyList);
              Navigator.pop(context);
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }
}