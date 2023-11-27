import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'add_list_page.dart';
import 'list.dart';
import 'main.dart';

class MyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My List Page"),
      ),
      body: ValueListenableBuilder<Box<MyList>>(
        valueListenable: Hive.box<MyList>(boxName).listenable(),
        builder: (context, box, child) {
          if (box.isEmpty) {
            return Center(
              child: Text("Data Kosong"),
            );
          }
          return _buildCommentList(box);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMyList(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCommentList(Box<MyList> box) {
    return ListView.builder(
      itemCount: box.length,
      itemBuilder: (context, index) {
        final comment = box.getAt(index);
        return Dismissible(
          key: Key(comment!.key.toString()),
          onDismissed: (direction) {
            _deleteComment(
                box, index); // Panggil fungsi untuk menghapus komentar
          },
          background: Container(
            color: Colors.purpleAccent,
          ),
          child: ListTile(
            title: Text(comment.name),
            subtitle: Text(comment.description),
          ),
        );
      },
    );
  }

  void _deleteComment(Box<MyList> box, int index) {
    box.deleteAt(index); // Hapus komentar pada indeks tertentu dari kotak
  }
}
