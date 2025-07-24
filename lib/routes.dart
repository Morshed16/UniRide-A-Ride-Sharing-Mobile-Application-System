import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/auth/login_rider.dart';
import 'screens/auth/login_driver.dart';
import 'screens/auth/signup_rider.dart';
import 'screens/auth/signup_driver.dart';
import 'screens/rider/rider_home.dart';
import 'screens/driver/driver_home.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const WelcomePage(),
  '/loginRider': (context) => const LoginRider(),
  '/loginDriver': (context) => const LoginDriver(),
  '/signupRider': (context) => const SignupRider(),
  '/signupDriver': (context) => const SignupDriver(),
  '/riderHome': (context) => const RiderHome(),
  '/driverHome': (context) => const DriverHome(),
};
