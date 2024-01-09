/**
 *Created by &{USER} on {DATE}*/
import 'package:flutter/material.dart' show AppBar, BuildContext, Colors, Column, EdgeInsets, ElevatedButton, InputDecoration, MainAxisAlignment, MaterialApp, Padding, Scaffold, SizedBox, State, StatefulWidget, StatelessWidget, Text, TextEditingController, TextField, ThemeData, Widget, runApp;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SignUpScreen(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        )
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle sign-up logic here
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Add your sign-up logic or API calls here

                // For demonstration purposes, print the entered data
                print('Username: $username');
                print('Password: $password');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
              ),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

