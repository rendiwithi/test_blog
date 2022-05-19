import 'package:flutter/material.dart';
import 'package:test_blog/model/article.dart';
import 'package:test_blog/screen/home_screen.dart';
import 'package:test_blog/widget/cart_input.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Article"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff9254C8),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Masukkan Judul"),
                ),
                cardInput(
                  controller: titleController,
                  hint: "Title",
                  isSecure: false,
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Masukkan Deskripsi"),
                ),
                cardInput(
                  controller: descController,
                  hint: "Description",
                  isSecure: false,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(20),
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descController.text.isNotEmpty) {
                  listArticle.add(
                    Article(
                        id: listArticle.length + 1,
                        title: titleController.text,
                        desc: descController.text,
                        status: 'published'),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff9254C8),
              ),
              child: const Text("Tambah Artikel"),
            ),
          ),
        ],
      ),
    );
  }
}
