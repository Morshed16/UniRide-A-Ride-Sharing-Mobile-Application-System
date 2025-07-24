import 'package:flutter/material.dart';

class RideHistoryPage extends StatelessWidget {
  const RideHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ride History')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: const Icon(Icons.directions_car),
            title: Text("Trip ${index + 1}"),
            subtitle: const Text("Pickup to Destination"),
          ),
        ),
      ),
    );
  }
}
