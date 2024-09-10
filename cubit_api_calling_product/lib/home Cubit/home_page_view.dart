import 'package:collection/collection.dart';
import 'package:cubit_api_calling_product/home%20Cubit/details_page_view.dart';
import 'package:cubit_api_calling_product/home%20Cubit/home_page_cubit.dart';
import 'package:cubit_api_calling_product/modal/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomePAgeViewCubit extends StatelessWidget {
  const HomePAgeViewCubit({super.key});

  static const String routeName = 'home_page_view_cubit';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit()..getAllProduct(),
      child: const HomePAgeViewCubit(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              if (state is HomePageLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomePageLoaded) {
                var groupedByProduct = groupBy(state.allProduct, (ProductModal product) => product.category);

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: TextField(
                        onChanged: (query) {
                          context.read<HomePageCubit>().onSearchAllFiled(query);
                        },
                        decoration: InputDecoration(
                          labelText: 'Search by title, brand, or category',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
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
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: state.selectedCategory == category
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
                                                  color:
                                                      state.selectedCategory == category ? Colors.white : Colors.black,
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
                                        childAspectRatio: 0.7,
                                      ),
                                      itemCount: state.filterProduct.length,
                                      itemBuilder: (context, index) {
                                        ProductModal product = state.filterProduct[index];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                              DetailsPageView.routeName,
                                              arguments: product,
                                            );
                                          },
                                          child: Container(
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
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
