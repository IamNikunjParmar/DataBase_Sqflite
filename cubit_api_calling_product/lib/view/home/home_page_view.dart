import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../controller/product_controller.dart';
import '../../modal/product_modal.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  static const String routeName = '/home_page_view';

  static Widget builder(BuildContext context) {
    return const HomePageView();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context, pro, _) {
        var groupedByProduct = groupBy(pro.allProducts, (ProductModal product) => product.category);
        List<ProductModal> selectedProducts = pro.selectedProducts;

        return Scaffold(
          body: SafeArea(
            child: Row(
              children: [
                // 1st Container
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      color: const Color(0xffE2E4E9),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: groupedByProduct.entries.map(
                          (e) {
                            String category = e.key;

                            return GestureDetector(
                              onTap: () {
                                pro.setSelectedCategory(category);
                              },
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: pro.selectedCategory == category
                                        ? const Color(0xff5C0319)
                                        : const Color(0xff939185),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 3,
                                        color: Colors.grey,
                                        offset: Offset(2, 2),
                                      )
                                    ]),
                                margin: const EdgeInsets.all(5),
                                child: Center(
                                  child: Text(category,
                                      style: TextStyle(
                                        color: pro.selectedCategory == category ? Colors.white : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),

                // 2nd Container: Products for selected category
                Expanded(
                  flex: 2,
                  child: Container(
                    color: const Color(0xffE2E4E9),
                    child: (pro.selectedProducts.isEmpty)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            padding: const EdgeInsets.all(10),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: selectedProducts.length,
                            itemBuilder: (context, index) {
                              ProductModal product = selectedProducts[index];
                              return Container(
                                height: 150,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        color: Colors.grey,
                                        offset: Offset(2, 2),
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      margin: const EdgeInsets.all(5),
                                      // color: Color(0xff5C0319),
                                      // Add thumbnail image for product if available
                                      child: (product.thumbnail.isEmpty)
                                          ? const Center(child: CircularProgressIndicator())
                                          : Image.network(
                                              product.thumbnail,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    const Gap(10),
                                    Text(
                                      product.title,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text("\$${product.price.toString()}"),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
