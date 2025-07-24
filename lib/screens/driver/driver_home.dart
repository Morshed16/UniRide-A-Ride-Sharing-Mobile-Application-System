import 'package:flutter/material.dart';

class DriverHome extends StatelessWidget {
  const DriverHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Driver Dashboard")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.local_taxi, color: Colors.deepPurple),
            title: const Text("Ride Request from John"),
            subtitle: const Text("Pickup: A | Destination: B"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.check_circle, color: Colors.green),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.cancel, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text("Available for rides"),
            value: true,
            onChanged: (val) {},
            activeColor: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}
