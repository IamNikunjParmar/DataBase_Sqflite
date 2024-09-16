import 'package:collection/collection.dart';
import 'package:cubit_api_calling_product/home%20Cubit/home_page_cubit.dart';
import 'package:cubit_api_calling_product/modal/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:gap/gap.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../cartCubit/cart_cubit.dart';
import '../cartCubit/cart_page_view.dart';
import '../modal/cart_modal.dart';

class DetailsPageView extends StatelessWidget {
  const DetailsPageView({super.key});

  static const String routeName = 'details_page_view';

  static Widget builder(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => HomePageCubit()..getAllProduct()),
      ],
      child: const DetailsPageView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartBox = Hive.box<CartModal>('CartBox');

    ProductModal product = ModalRoute.of(context)!.settings.arguments as ProductModal;

    int sumRating = 0;
    for (var i = 0; i < product.reviews.length; i++) {
      sumRating += product.reviews[i].rating;
    }
    double totalAvg = sumRating / product.reviews.length;
    print("$totalAvg-----------------------+++++++++++++++++++++");

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartPageView.routeName);
            },
            icon: const Icon(Icons.shopping_cart),
            color: const Color(0xff5C0319),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: product.thumbnail,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff5C0319),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.warning),
                ),
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.title.length > 35 ? '${product.title.substring(0, 35)}...' : product.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "₹${product.price.toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: Color(0xff5C0319),
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  const Text(
                    "Brand:",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    product.brand ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              const Text(
                "Description:",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              const Gap(5),
              Text(
                product.description,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const Gap(10),
              const Text(
                "Images",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              const Gap(5),
              SizedBox(
                height: 100, // Set height for horizontal scroll area
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.images.length,
                  itemBuilder: (ctx, index) {
                    final image = product.images[index];
                    return Container(
                      height: 85,
                      width: 100,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff5C0319),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.warning),
                      ),
                    );
                  },
                ),
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Reviews",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  RatingStars(
                    value: totalAvg,
                    starColor: Colors.yellow,
                  ),
                ],
              ),
              const Gap(5),
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: product.reviews.length,
                    itemBuilder: (ctx, index) {
                      List<Review> review = product.reviews;
                      print("$review------------++++++++++++++++++++++");
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Name:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  review[index].reviewerName.toString() ?? 'no',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "comment:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  review[index].comment.toString() ?? 'no',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "rating:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  review[index].rating.toString() ?? 'no',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddToCartWidget(product: product, cartBox: cartBox),
    );
  }
}

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    super.key,
    required this.product,
    required this.cartBox,
  });

  final ProductModal product;
  final Box<CartModal> cartBox;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 400,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border.fromBorderSide(
          BorderSide(
            width: 0.5,
          ),
        ),
      ),
      child: InkWell(
        onTap: () async {
          final cartCubit = context.read<CartCubit>();
          final productInCart = cartCubit.allProduct.firstWhereOrNull(
            (item) => item.id == product.id,
          );

          if (productInCart == null) {
            CartModal newProduct = CartModal(
              id: product.id,
              title: product.title,
              thumbnail: product.thumbnail,
              price: product.price,
              quntitey: 1,
              totalPrice: product.price,
            );
            // cartCubit.addToCart(newProduct);
          }
        },
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cartItem = context.read<CartCubit>().allProduct.firstWhereOrNull(
                  (item) => item.id == product.id,
                );

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
                        // context.read<CartCubit>().decrementQuantity(product.id, cartItem);
                      },
                      child: const Icon(Icons.remove),
                    ),
                    Text("${cartItem.quntitey}"),
                    GestureDetector(
                      onTap: () {
                        // context.read<CartCubit>().incrementQuantity(product.id, cartItem);
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
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
              );
            }
          },
        ),
      ),
    );
  }
}
