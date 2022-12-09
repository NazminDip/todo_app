import 'package:app_first/pages/pro_page.dart';
import 'package:flutter/material.dart';

import '../model/todo.dart';
import 'first_page.dart';
import 'home_page.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  final todo = ToDo.todolist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FirstPage()));
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: const Text(
            'Create New',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Text(
                "Choose Activity",
                style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Text(
                "Choose  activity to create new task",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            const SizedBox(height: 5),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 1,
                ),
                itemCount: todo.length,
                itemBuilder: (context, index) {
                  final task = todo[index];
                  return Column(
                    children: [
                      Container(
                        width: 80,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProPage())),
                            child: Image.asset(
                              task.taskicon,
                              width: 5,
                              height: 5,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          task.taskname,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ],
                  );
                }),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(color: Colors.pink, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: const Text(
                    'Choose Activity',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  )),
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}
