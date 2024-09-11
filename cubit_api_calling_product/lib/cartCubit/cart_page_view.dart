import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubit_api_calling_product/cartCubit/cart_cubit.dart';
import 'package:cubit_api_calling_product/home%20Cubit/home_page_cubit.dart';
import 'package:cubit_api_calling_product/modal/cart_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({super.key});

  static const String routeName = "cart_page_view";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit()..getCartProduct(),
      child: const CartPageView(),
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    final cartBox = Hive.box<CartModal>('CartBox');
    return Scaffold(
      backgroundColor: const Color(0xffE2E4E9),
      appBar: AppBar(
        backgroundColor: const Color(0xffE2E4E9),
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            if (state.products.isEmpty) {
              return const Center(
                  child: Text(
                "No Product in the cart",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ));
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (ctx, index) {
                    CartModal cartProduct = state.products[index];

                    return Slidable(
                      key: const ValueKey(0),
                      endActionPane: ActionPane(
                        dismissible: DismissiblePane(onDismissed: () {}),
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (val) {
                              context.read<CartCubit>().removeProduct(cartProduct.id);
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Container(
                        height: 130,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),

                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: const BoxDecoration(
                                  //color: Colors.amber,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: cartProduct.thumbnail,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xff5C0319),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 240,
                                decoration: const BoxDecoration(
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartProduct.title,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Gap(10),
                                    Text(
                                      ("\$${cartProduct.price.toString()}"),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xff5C0319),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            //color: Colors.amber,
                                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                                            border: Border.all(
                                              color: const Color(0xff5C0319),
                                              width: 2,
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(Icons.remove),
                                              Text("1"),
                                              Icon(Icons.add),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          } else if (state is CartError) {
            return Text(state.message);
          }
          return const Center(child: Text('NO Data'));
        },
      ),
    );
  }
}
