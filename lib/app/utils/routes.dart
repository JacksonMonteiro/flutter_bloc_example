// ignore_for_file: constant_identifier_names

import 'package:bloc/app/views/home_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static final Routes instance = Routes._();
  Routes._();

  // Name of Routes
  static const String HOME = '/';

  // Initial Route
  String get initialRoute => HOME;

  // Routes map
  Map<String, Widget Function(BuildContext)> get routes => {
    HOME: (context) => const HomeView(),
  };
}