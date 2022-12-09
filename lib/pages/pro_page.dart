import 'package:app_first/constant/bootom_page.dart';

import 'package:flutter/material.dart';

class ProPage extends StatefulWidget {
  const ProPage({super.key, this.restorationId});

  final String? restorationId;
  @override
  State<ProPage> createState() => _ProPageState();
}

class _ProPageState extends State<ProPage> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
            backgroundColor: const Color.fromARGB(255, 240, 128, 165)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: _buildAppbar(),
      body: SingleChildScrollView(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              width: 800,
              height: 280,
              decoration: BoxDecoration(
                  color: Colors.pink, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Create User Flow for Client ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'write your task detail or anything you wanna add  select date and make working list',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: 80,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.calendar_month,
                                size: 35,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Container(
                            width: 50,
                            height: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 250, 139, 176),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  _restorableDatePickerRouteFuture.present();
                                },
                                child: const Text(
                                  'Select Date',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),

        ///

        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 240, 128, 165),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 240, 128, 165),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 240, 128, 165),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 240, 128, 165),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 240, 128, 165),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 240, 128, 165),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ]),
      ])),

      drawer: Drawer(
          child: ListView(children: const [
        DrawerHeader(
          decoration: BoxDecoration(color: Color.fromARGB(255, 240, 128, 165)),
          child: UserAccountsDrawerHeader(
            currentAccountPicture: Padding(
              padding: EdgeInsets.all(5),
              child: CircleAvatar(
                radius: 500,
                backgroundImage: AssetImage('images/m.png'),
              ),
            ),
            accountEmail: Text('Alex@gmail.com'),
            accountName: Text('Alex Ahmed'),
          ),
        ),
        ListTile(
          title: Text('Account Name'),
          subtitle: Text('change Name'),
          trailing: Icon(
            Icons.edit,
            color: Colors.pink,
          ),
        ),
        ListTile(
          title: Text('Password'),
          subtitle: Text('forger password'),
          trailing: Icon(
            Icons.lock,
            color: Colors.pink,
          ),
        ),
        ListTile(
          title: Text('Message'),
          subtitle: Text('send'),
          trailing: Icon(
            Icons.send,
            color: Colors.pink,
          ),
        ),
      ])),

      /////////////////////////////////////////  BOTTOM NAV
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 500,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: const BottomPage(),
        ),
      ),
    );
  }

////////////////////////////////////////  APPPBAR
  _buildAppbar() {
    return AppBar(
      title: ListTile(
        contentPadding: const EdgeInsets.all(30),
        title: const Text(
          'Hi, Designer',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        ),
        subtitle: const Text(
          'Do You have 4 Task',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        trailing: Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset('images/m.png')),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
