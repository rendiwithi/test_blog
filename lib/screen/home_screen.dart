import 'package:flutter/material.dart';
import 'package:test_blog/model/article.dart';
import 'package:test_blog/screen/add_screen.dart';

import 'edit_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(20),
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff9254C8),
                ),
                child: const Text("Tambah Artikel"),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listArticle.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xffFAF0D7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listArticle[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                listArticle[index].desc,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditScreen(
                                  dataArticle: listArticle[index],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit, color: Colors.green),
                        ),
                        IconButton(
                          onPressed: () {
                            listArticle.removeAt(index);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
