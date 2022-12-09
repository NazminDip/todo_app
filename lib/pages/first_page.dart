// ignore_for_file: unnecessary_string_escapes

import 'package:app_first/constant/bg_image.dart';
import 'package:app_first/pages/pro_page.dart';
import 'package:app_first/pages/second_page.dart';

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  var isVisible = true;

  @override
  void initState() {
    super.initState();
    userController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
                child: Form(
              key: formkey,
              child: Column(
                children: [
                  Column(
                    children: [
                      const BgImage(),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Welcome To Do',
                          style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                          validator: ((value) {
                            return emailValidation(value);
                          }),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 236, 231, 231),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                )),
                            label: Text('Gmail:'),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink),
                            suffix: Icon(Icons.mail, color: Colors.pink),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                          controller: passwordController,
                          validator: ((value) {
                            return passwordValidation(value);
                          }),
                          obscureText: isVisible ? true : false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 236, 231, 231),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            label: const Text('Password:'),
                            labelStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink),
                            suffix: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: isVisible
                                  ? const Icon(Icons.visibility_off,
                                      color: Colors.pink)
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.pink,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      ///////////////////////////////////////////// Button

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.pink,
                                minimumSize: const Size(double.infinity, 50),
                                side: const BorderSide(
                                    color: Colors.pink, width: 3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {
                              logInButton();
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      ////////////////////////////////////////////////////////////////////////
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Forget Password?',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(width: 7),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SecondPage()));
                            },
                            child: const Text(
                              'Register Now',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ),
        ));
  }

  //Validation

  emailValidation(var value) {
    if (value.isEmpty) {
      return 'Enter Your Gmail';
    } else if (!value.contains('@gmail.com')) {
      return 'Please Enter Valid Gmail';
    }
    return null;
  }

  passwordValidation(value) {
    if (value.isEmpty) {
      return 'Enter Your  Password';
    } else if (value.length <= 7) {
      return 'Please Password at least 8 Character';
    }
    return null;
  }

  logInButton() {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      formkey.currentState!.save();
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Your Gmail or Password Is Incorrect",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.pink,
      ));
    } else if (isValid) {
      return Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ProPage()));
    }
  }
}
