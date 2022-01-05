import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_tuesday/views/screens/home_screen.dart';
import 'package:sample_app_tuesday/views/screens/products_screen.dart';

void main() {
  runApp(const GetMaterialApp(
    home: ProductsScreen(),
  ));
}
