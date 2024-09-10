import 'package:cubit_api_calling_product/modal/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:gap/gap.dart';

class DetailsPageView extends StatelessWidget {
  const DetailsPageView({super.key});

  static const String routeName = 'details_page_view';

  static Widget builder(BuildContext context) {
    return const DetailsPageView();
  }

  @override
  Widget build(BuildContext context) {
    ProductModal product = ModalRoute.of(context)!.settings.arguments as ProductModal;

    int sumRating = 0;
    for (var i = 0; i < product.reviews.length; i++) {
      sumRating += product.reviews[i].rating;
    }
    double totalAvg = sumRating / product.reviews.length;
    print("$totalAvg-----------------------+++++++++++++++++++++");

    return Scaffold(
      appBar: AppBar(
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
                  image: DecorationImage(
                    image: NetworkImage(product.thumbnail),
                  ),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "₹${product.price.toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
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
                        image: DecorationImage(
                          image: NetworkImage(image),
                        ),
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
              SizedBox(
                height: 200, // Set height for reviews section
                child: ListView.builder(
                  //physics: const NeverScrollableScrollPhysics(),
                  itemCount: product.reviews.length,
                  itemBuilder: (ctx, index) {
                    List<Review> review = product.reviews;
                    print("$review------------++++++++++++++++++++++");
                    return Card(
                      child: Padding(
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
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
