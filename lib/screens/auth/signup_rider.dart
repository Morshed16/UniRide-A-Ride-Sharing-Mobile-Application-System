import 'package:flutter/material.dart';

class SignupRider extends StatelessWidget {
  const SignupRider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Rider Sign Up", style: TextStyle(fontSize: 26, color: Colors.white)),
            const SizedBox(height: 30),
            const TextField(
              decoration: InputDecoration(labelText: 'Full Name', fillColor: Colors.white, filled: true),
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
              onPressed: () => Navigator.pushNamed(context, '/riderHome'),
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
