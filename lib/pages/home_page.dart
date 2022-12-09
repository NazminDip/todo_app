// ignore_for_file: unused_import

import 'package:app_first/pages/success_page.dart';

import 'package:app_first/widget/work_item.dart';
import 'package:flutter/material.dart';

import '../model/work.dart';
import 'first_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final worklist = Work.worklist();
  List<Work> _findwork = [];
  final _workController = TextEditingController();

  @override
  void initState() {
    setState(() {
      _findwork = worklist;
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              'Task Detail',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuccessPage()));
                Navigator.canPop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.white,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 2),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 5,
                  )),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: ListView(children: [
          SearchBox(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: const Text(
              "Task List",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold),
            ),
          ),
          for (Work workoo in _findwork.reversed)
            WorkItem(
              work: workoo,
              onworkChanged: _changeWork,
              onDeleteItem: _deleteWork,
            ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  color: const Color.fromARGB(255, 240, 128, 165),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                  controller: _workController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter Your Task',
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ),

          ///////////////////////////////////////////////// BUTTON
          Padding(
            padding: const EdgeInsets.only(top: 3, left: 15, right: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    minimumSize: const Size(double.infinity, 50),
                    side: const BorderSide(color: Colors.pink, width: 3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  _addWorkItem(_workController.text);
                },
                child: const Text(
                  'Add New Task',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
          const SizedBox(height: 15),
        ]));
  }

  ////  METHOD
  void _changeWork(Work work) {
    setState(() {
      work.isDone = !work.isDone;
    });
  }
  //////////////////////////////////     ADD ITEM

  void _addWorkItem(String work) {
    setState(() {
      worklist.add(Work(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          worktext: work));
    });
    _workController.clear();
  }

  //////////////////////////////////    DELETE
  void _deleteWork(String id) {
    setState(() {
      worklist.removeWhere((item) => item.id == id);
    });
  }

/////////////      SEARCH

  // ignore: non_constant_identifier_names
  Widget SearchBox() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: TextField(
            onChanged: (value) => _runfilter(value),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                size: 20,
                color: Colors.black,
              ),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, minWidth: 25),
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
            )),
      ),
    );
  }

  ///////////////////////////////////  SEARCH
  void _runfilter(String enterKeyword) {
    List<Work> result = [];
    if (enterKeyword.isEmpty) {
      result = worklist;
    } else {
      result = worklist
          .where((item) =>
              item.worktext!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _findwork = result;
    });
  }
}
