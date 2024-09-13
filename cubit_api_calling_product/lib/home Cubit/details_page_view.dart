import 'package:cubit_api_calling_product/modal/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:gap/gap.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive/hive.dart';

import '../cartCubit/cart_cubit.dart';
import '../cartCubit/cart_page_view.dart';
import '../modal/cart_modal.dart';

class DetailsPageView extends StatelessWidget {
  const DetailsPageView({super.key});

  static const String routeName = 'details_page_view';

  static Widget builder(BuildContext context) {
    return const DetailsPageView();
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
          CartModal newProduct = CartModal(
              id: product.id,
              title: product.title,
              thumbnail: product.thumbnail,
              price: product.price,
              quntitey: 1,
              totalPrice: product.price);

          context.read<CartCubit>().addToCart(product.id, newProduct);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(milliseconds: 400),
              content: Text("Product add to Cart"),
              showCloseIcon: true,
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );

          print(product.id);
          print("CARTBOX:::::::::::::${cartBox.values.length}");
        },
        child: Container(
          height: 25,
          width: 80,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xff5C0319),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              Gap(8),
              Text(
                "Add To Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
