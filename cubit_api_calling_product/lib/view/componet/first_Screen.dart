import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../controller/product_controller.dart';
import '../../modal/product_modal.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductController>(
        builder: (context, pro, _) {
          if (pro.allProducts.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
            ),
            itemCount: pro.allProducts.length,
            itemBuilder: (context, index) {
              ProductModal product = pro.allProducts[index];

              return Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image(
                        image: NetworkImage(product.thumbnail),
                      ),
                    ),
                    Center(
                      child: Text(product.title),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
