import 'package:flutter/material.dart';
import 'package:test_blog/model/article.dart';
import 'package:test_blog/screen/home_screen.dart';
import 'package:test_blog/widget/cart_input.dart';

class EditScreen extends StatefulWidget {
  final Article dataArticle;
  const EditScreen({Key? key, required this.dataArticle}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.dataArticle.title;
    descController.text = widget.dataArticle.desc;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Article"),
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
                  var data = listArticle.firstWhere(
                      (element) => element.id == widget.dataArticle.id);
                  data.title = titleController.text;
                  data.desc = descController.text;
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
