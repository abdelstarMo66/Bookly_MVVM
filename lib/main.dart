import 'package:flutter/material.dart';
import 'app.dart';
import 'core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

