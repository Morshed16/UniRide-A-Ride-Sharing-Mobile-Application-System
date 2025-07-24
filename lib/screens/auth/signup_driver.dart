import 'package:flutter/material.dart';

class SignupDriver extends StatelessWidget {
  const SignupDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Driver Sign Up", style: TextStyle(fontSize: 26, color: Colors.white)),
            const SizedBox(height: 30),
            const TextField(
              decoration: InputDecoration(labelText: 'Full Name', fillColor: Colors.white, filled: true),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(labelText: 'Vehicle Number', fillColor: Colors.white, filled: true),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(labelText: 'Email', fillColor: Colors.white, filled: true),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(labelText: 'Password', fillColor: Colors.white, filled: true),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/driverHome'),
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
