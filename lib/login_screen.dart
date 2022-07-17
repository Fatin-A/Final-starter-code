// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map_exam/home_screen.dart';

class LoginScreen extends StatefulWidget {
  get _firebaseAuth => null;

  static Route route() =>
      MaterialPageRoute(builder: (_) => const LoginScreen());
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  // GET UID
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).id;
  }

  // GET CURRENT USER
  Future getCurrentUser() async {
    return await _firebaseAuth.currentUser();
  }

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user
        .id;
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Please sign in', style: TextStyle(fontSize: 35.0)),
              const SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration:
                    const InputDecoration(hintText: 'Type your email here'),
                onTap: () {},
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Type your password',
                ),
                onTap: () {},
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                  child: const Text('Sign in'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
