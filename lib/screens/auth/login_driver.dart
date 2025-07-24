import 'package:flutter/material.dart';

class LoginDriver extends StatelessWidget {
  const LoginDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.deepPurple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Driver Login", style: TextStyle(fontSize: 26, color: Colors.white)),
            const SizedBox(height: 30),
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
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signupDriver');
              },
              child: const Text(
                "Don't have an account? Sign up",
                style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
