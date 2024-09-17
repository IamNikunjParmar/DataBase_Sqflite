import 'dart:async';

import 'package:collection/collection.dart';
import 'package:cubit_api_calling_product/cartCubit/cart_cubit.dart';
import 'package:cubit_api_calling_product/cartCubit/cart_page_view.dart';
import 'package:cubit_api_calling_product/helper/db_helper.dart';
import 'package:cubit_api_calling_product/detailPage/details_page_view.dart';
import 'package:cubit_api_calling_product/home%20Cubit/home_page_cubit.dart';
import 'package:cubit_api_calling_product/modal/cart_modal.dart';
import 'package:cubit_api_calling_product/modal/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class HomePAgeViewCubit extends StatelessWidget {
  const HomePAgeViewCubit({super.key});

  static const String routeName = 'home_page_view_cubit';

  static Widget builder(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => HomePageCubit()..getAllProduct()),
        BlocProvider(create: (_) => CartCubit()..getCartProduct())
      ],
      child: const HomePAgeViewCubit(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartBox = Hive.box<CartModal>('CartBox');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE2E4E9),
        toolbarHeight: 80,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: TextField(
                onChanged: (query) {
                  context.read<HomePageCubit>().onSearchAllFiled(query);
                },
                onTapOutside: (val) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  labelText: 'Search by title, brand, or category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartPageView.routeName);
            },
            icon: const Icon(Icons.shopping_cart),
            color: const Color(0xff5C0319),
          ),
        ],
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          if (state is HomePageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomePageLoaded) {
            var groupedByProduct = groupBy(state.allProduct, (ProductModal product) => product.category);

            return RefreshIndicator(
              onRefresh: () {
                return context.read<HomePageCubit>().getAllProduct();
              },
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              color: const Color(0xffE2E4E9),
                              child: ListView(
                                children: groupedByProduct.entries.map(
                                  (e) {
                                    String category = e.key;

                                    return GestureDetector(
                                      onTap: () {
                                        context.read<HomePageCubit>().setSelectedCategory(category);
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: state.selectedCategory == category
                                                ? const Color(0xff5C0319)
                                                : Colors.white,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 7,
                                                color: Colors.grey.shade600,
                                                offset: const Offset(4, 4),
                                              )
                                            ]),
                                        margin: const EdgeInsets.all(5),
                                        child: Center(
                                          child: Text(category,
                                              style: TextStyle(
                                                color: state.selectedCategory == category ? Colors.white : Colors.black,
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
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: const Color(0xffE2E4E9),
                            child: (state.filterProduct.isEmpty)
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : GridView.builder(
                                    padding: const EdgeInsets.all(10),
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 15,
                                      childAspectRatio: 0.56,
                                    ),
                                    itemCount: state.filterProduct.length,
                                    itemBuilder: (context, index) {
                                      ProductModal product = state.filterProduct[index];
                                      return Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.grey.shade600,
                                                offset: const Offset(4, 4),
                                              )
                                            ]),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context)
                                                    .pushNamed(DetailsPageView.routeName, arguments: product);
                                              },
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                margin: const EdgeInsets.all(5),
                                                // color: Color(0xff5C0319),
                                                // Add thumbnail image for product if available
                                                child: CachedNetworkImage(
                                                  imageUrl: product.thumbnail,
                                                  placeholder: (context, url) => const Center(
                                                    child: CircularProgressIndicator(
                                                      color: Color(0xff5C0319),
                                                    ),
                                                  ),
                                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                            const Gap(10),
                                            Text(
                                              product.title,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "\$${product.price.toString()}",
                                              style: const TextStyle(
                                                color: Color(0xff5C0319),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Gap(10),
                                            StreamBuilder<BoxEvent>(
                                              stream: cartBox.watch(key: product.id),
                                              builder: (context, snapshot) {
                                                final cartItem = cartBox.get(product.id);
                                                if (cartItem != null) {
                                                  return Container(
                                                    alignment: AlignmentDirectional.center,
                                                    height: 30,
                                                    width: 90,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            context
                                                                .read<CartCubit>()
                                                                .decrementProductQuantity(cartItem);
                                                          },
                                                          child: const Icon(Icons.remove),
                                                        ),
                                                        Text("${cartItem.quntitey}"),
                                                        GestureDetector(
                                                          onTap: () {
                                                            context
                                                                .read<CartCubit>()
                                                                .incrementProductQuantity(cartItem);
                                                          },
                                                          child: const Icon(Icons.add),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      context.read<CartCubit>().addToCart(product);
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        const SnackBar(
                                                          content: Text("Product added to cart"),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      alignment: AlignmentDirectional.center,
                                                      height: 30,
                                                      width: 90,
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xff5C0319),
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      child: const Text(
                                                        "Add to Cart",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            )
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
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
