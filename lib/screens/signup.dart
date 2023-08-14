// ignore_for_file: file_names, prefer_final_fields, unnecessary_null_comparison


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_app/Widget/Roundbutton.dart';
import 'package:video_app/screens/Home.dart';
import 'package:video_app/model/connections.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  AuthService auth = AuthService();
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> createaccount() async {
    try {
      setState(() {
        loading = true; // Show loading indicator
      });

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      );

      setState(() {
        loading = false; // Hide loading indicator
      });

      if (userCredential != null) {
        // Navigation to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // Handle signup failure
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: const Text(
          'Signup Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Email',
                  helperText: 'abc@something.com',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock_outline),
                  hintText: 'Password',
                  helperText: 'Enter a valid Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Roundbutton(
                  buttcolor: Colors.green.shade800,
                  Loading: loading,
                  title: 'Signup',
                  Style: const TextStyle(color: Colors.white),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      createaccount();
                    }
                  },
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
