import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_tuesday/controllers/products_controller.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductsController());
    return Scaffold(
        body: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Wrap(
                  children: controller.products
                      .map((product) => SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 200,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        product.image,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                    Text(
                                      product.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(product.despcription,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(fontSize: 12)),
                                    Text(product.price.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              elevation: 10,
                              shadowColor: Colors.blue,
                              margin: const EdgeInsets.all(10),
                            ),
                          ))
                      .toList(),
                ),
              )));
  }
}
