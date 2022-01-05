import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_tuesday/model/product.dart';
import 'package:sample_app_tuesday/services/products_service.dart';

class ProductsController extends GetxController {
  List<Product> products = RxList<Product>();
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAllProducts();
    super.onInit();
  }

  fetchAllProducts() async {
    try {
      final response = await ProductService().getProducts();
      if (response != null) {
        Map<String, dynamic> _body = jsonDecode(response);
        if (_body['success']) {
          List jsonResponse = _body["data"];
          products =
              jsonResponse.map((data) => Product.fromJson(data)).toList();
          Get.snackbar('Success', 'Products fetched successfully',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white);
        }
      } else {
        Get.snackbar('Error', "Something went wrong on server",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}
