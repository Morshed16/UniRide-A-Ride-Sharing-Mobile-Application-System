import 'package:flutter/material.dart';
import 'book_ride.dart';
import 'ride_history.dart';

class RiderHome extends StatefulWidget {
  const RiderHome({super.key});

  @override
  State<RiderHome> createState() => _RiderHomeState();
}

class _RiderHomeState extends State<RiderHome> {
  int _index = 0;
  final List<Widget> _pages = [const BookRidePage(), const RideHistoryPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) => setState(() => _index = value),
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.local_taxi), label: 'Book Ride'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Ride History'),
        ],
      ),
    );
  }
}
