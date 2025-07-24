import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class BookRidePage extends StatefulWidget {
  const BookRidePage({Key? key}) : super(key: key);

  @override
  State<BookRidePage> createState() => _BookRidePageState();
}

class _BookRidePageState extends State<BookRidePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController pickupController = TextEditingController();
  TextEditingController dropoffController = TextEditingController();
  String selectedVehicle = 'Car (4 seats)';
  String selectedPayment = 'Cash';
  String currentTime = DateFormat('hh:mm a').format(DateTime.now());

  List<String> destinations = [
    'UPSI Main Gate',
    'Proton City',
    'Tanjong Malim KTM Station',
    'Tanjong Malim Town',
    'UPSI E-Learning Centre',
    'Taman Bahtera',
    'Taman Universiti',
    'Behrang 2020',
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address = "${place.street}, ${place.locality}";
        setState(() {
          pickupController.text = address;
        });
      }
    } catch (e) {
      setState(() {
        pickupController.text = "Unable to fetch location";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Sample Rent Calculation
    double baseFare = 2.0;
    double perKmRate = 1.5;
    double exampleDistanceInKm = 5.0;
    double calculatedFare = baseFare + (exampleDistanceInKm * perKmRate);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F9),
      appBar: AppBar(
        title: Text("Book a Ride", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Pickup Location", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: pickupController,
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.my_location, color: Colors.teal),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 20),

                Text("Drop-off Location", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: dropoffController,
                    decoration: InputDecoration(
                      hintText: 'Enter destination',
                      prefixIcon: const Icon(Icons.location_on, color: Colors.teal),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  suggestionsCallback: (pattern) {
                    return destinations.where((item) => item.toLowerCase().contains(pattern.toLowerCase()));
                  },
                  itemBuilder: (context, String suggestion) {
                    return ListTile(title: Text(suggestion));
                  },
                  onSuggestionSelected: (String suggestion) {
                    dropoffController.text = suggestion;
                  },
                  validator: (value) => value!.isEmpty ? 'Please select a destination' : null,
                ),
                const SizedBox(height: 20),

                Text("Vehicle Type", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  children: [
                    ChoiceChip(
                      label: Text('🚗 Car (4 seats)', style: GoogleFonts.poppins()),
                      selected: selectedVehicle == 'Car (4 seats)',
                      onSelected: (_) => setState(() => selectedVehicle = 'Car (4 seats)'),
                      selectedColor: Colors.teal,
                      backgroundColor: Colors.grey[200],
                      labelStyle: TextStyle(color: selectedVehicle == 'Car (4 seats)' ? Colors.white : Colors.black),
                    ),
                    ChoiceChip(
                      label: Text('🚐 MPV (6 seats)', style: GoogleFonts.poppins()),
                      selected: selectedVehicle == 'MPV (6 seats)',
                      onSelected: (_) => setState(() => selectedVehicle = 'MPV (6 seats)'),
                      selectedColor: Colors.teal,
                      backgroundColor: Colors.grey[200],
                      labelStyle: TextStyle(color: selectedVehicle == 'MPV (6 seats)' ? Colors.white : Colors.black),
                    ),
                    ChoiceChip(
                      label: Text('🚖 Van (7 seats)', style: GoogleFonts.poppins()),
                      selected: selectedVehicle == 'Van (7 seats)',
                      onSelected: (_) => setState(() => selectedVehicle = 'Van (7 seats)'),
                      selectedColor: Colors.teal,
                      backgroundColor: Colors.grey[200],
                      labelStyle: TextStyle(color: selectedVehicle == 'Van (7 seats)' ? Colors.white : Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // 💰 Estimated Rent Section
                Text("Estimated Rent (RM)", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: "RM ${calculatedFare.toStringAsFixed(2)}",
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.attach_money, color: Colors.teal),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 20),

                Text("Payment Method", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  children: [
                    ChoiceChip(
                      label: Text('💵 Cash', style: GoogleFonts.poppins()),
                      selected: selectedPayment == 'Cash',
                      onSelected: (_) => setState(() => selectedPayment = 'Cash'),
                      selectedColor: Colors.teal,
                      backgroundColor: Colors.grey[200],
                      labelStyle: TextStyle(color: selectedPayment == 'Cash' ? Colors.white : Colors.black),
                    ),
                    ChoiceChip(
                      label: Text('💳 Card', style: GoogleFonts.poppins()),
                      selected: selectedPayment == 'Card',
                      onSelected: (_) => setState(() => selectedPayment = 'Card'),
                      selectedColor: Colors.teal,
                      backgroundColor: Colors.grey[200],
                      labelStyle: TextStyle(color: selectedPayment == 'Card' ? Colors.white : Colors.black),
                    ),
                    ChoiceChip(
                      label: Text('📱 E-Wallet', style: GoogleFonts.poppins()),
                      selected: selectedPayment == 'E-Wallet',
                      onSelected: (_) => setState(() => selectedPayment = 'E-Wallet'),
                      selectedColor: Colors.teal,
                      backgroundColor: Colors.grey[200],
                      labelStyle: TextStyle(color: selectedPayment == 'E-Wallet' ? Colors.white : Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Text("Time", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: currentTime,
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.access_time, color: Colors.teal),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 30),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Ride booked successfully!'),
                          backgroundColor: Colors.teal,
                        ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    ),
                    child: Text("Book Now", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
