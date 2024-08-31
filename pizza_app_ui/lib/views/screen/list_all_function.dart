import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pizza_app_ui/modal/product_modal.dart';

class ListAllFunctionScreen extends StatefulWidget {
  const ListAllFunctionScreen({super.key});

  @override
  State<ListAllFunctionScreen> createState() => _ListAllFunctionScreenState();
}

class _ListAllFunctionScreenState extends State<ListAllFunctionScreen> {
  final List<Product> products = [
    Product(name: 'Product 1', price: 10.0, category: ' apple'),
    Product(name: 'Product 2', price: 25.0, category: ' samsung'),
    Product(name: 'Product 3', price: 25000.0, category: ' vivo'),
    Product(name: 'Product 4', price: 30.0, category: ' oppo'),
    Product(name: 'Product 5', price: 20.0, category: ' apple'),
    Product(name: 'Product 6', price: 70.0, category: ' apple'),
    Product(name: 'Product 7', price: 80.0, category: 'vivo'),
    Product(name: 'Product 8', price: 150.0, category: ' oppo'),
    Product(name: 'Product 9', price: 2000.0, category: ' samsung'),
    Product(name: 'Product 10', price: 100.0, category: ' realme'),
    Product(name: 'Product 11', price: 140.0, category: ' nokia'),
    Product(name: 'Product 12', price: 300.0, category: ' pixel'),
    Product(name: 'Product 13', price: 400.0, category: ' realme'),
    Product(name: 'Product 14', price: 1200.0, category: ' apple'),
    Product(name: 'Product 15', price: 110.0, category: ' realme'),
    Product(name: 'Product 16', price: 290.0, category: ' vivo'),
    Product(name: 'Product 17', price: 450.0, category: ' pixel'),
  ];

  String filterPrice = '';
  List filterProduct = [];
  String newCategory = '';
  double total = 2;
  double filterTotal = 0;

  void filterProductByPrice(String price) {
    setState(() {
      filterPrice = price;
      filterProduct = products.where((product) => product.price.toStringAsFixed(2).startsWith(filterPrice)).toList();
    });
  }

  void filterBYCategory(String cat) {
    setState(() {
      newCategory = cat;
      filterProduct = products.where((product) => product.category.startsWith(newCategory)).toList();
    });
  }

  void categoryForApple(String cat) {
    setState(() {
      newCategory = cat;
      filterProduct = products.where((product) => product.category.startsWith("a", 1)).toList();
    });
  }

  void categoryForSamsung(String cat) {
    setState(() {
      newCategory = cat;
      filterProduct = products.where((product) => product.category.startsWith("s", 1)).toList();
    });
  }

  double allPriceByTotal() {
    double total = products.fold(0.0, (price, product) => price + product.price);
    double filterTotal = filterProduct.fold(0.0, (price, filterProduct) => filterProduct.price + price);

    print("TOtal:-------$filterTotal");
    //return total;
    return filterTotal;
  }

  // double filterAllPriceByTotal() {
  //
  //   return filterTotal;
  // }

  totalPriceForFilterProduct(String price) {
    setState(() {
      filterPrice = price;
    });
  }

  void filterPrice50(String price) {
    setState(() {
      filterPrice = price;
      filterProduct = products.where((product) => product.price < 50).toList();
    });
  }

  void filterPrice500(String price) {
    setState(() {
      filterPrice = price;
      filterProduct = products.where((product) => product.price < 500).toList();
    });
  }

  bool? appleValue = false;
  bool? samsungValue = false;

  @override
  void initState() {
    double total = allPriceByTotal();
    double filterTotal = allPriceByTotal();
    // TODO: implement initState
    filterProduct = products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("List All Function"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20,
              ),
              PopupMenuButton(
                  itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                                          return Container(
                                            height: 350,
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  child: CheckboxMenuButton(
                                                    value: appleValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        appleValue = value;
                                                        (appleValue == false)
                                                            ? filterProductByPrice(filterPrice)
                                                            : filterPrice50(filterPrice);

                                                        Navigator.of(context).pop();
                                                      });
                                                    },
                                                    child: const Text("Rs.50 and Below"),
                                                  ),
                                                ),
                                                CheckboxMenuButton(
                                                  value: samsungValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      samsungValue = value;
                                                      (appleValue == false)
                                                          ? filterProductByPrice(filterPrice)
                                                          : filterPrice500(filterPrice);

                                                      Navigator.of(context).pop();
                                                    });
                                                  },
                                                  child: const Text("Rs.500 and Below"),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                      });
                                },
                                child: const Text("Price"),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                                          return Container(
                                            height: 350,
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  child: CheckboxMenuButton(
                                                    value: appleValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        appleValue = value;
                                                        (appleValue == false)
                                                            ? filterBYCategory(newCategory)
                                                            : categoryForApple(newCategory);
                                                        Navigator.of(context).pop();
                                                      });
                                                    },
                                                    child: const Text("apple"),
                                                  ),
                                                ),
                                                CheckboxMenuButton(
                                                  value: samsungValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      samsungValue = value;
                                                      (samsungValue == false)
                                                          ? filterBYCategory(newCategory)
                                                          : categoryForSamsung(newCategory);
                                                      Navigator.of(context).pop();
                                                    });
                                                  },
                                                  child: const Text("samsung"),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                      });
                                },
                                child: const Text("Category"),
                              ),
                            ],
                          ),
                        ),
                      ]),
              TextField(
                  decoration: const InputDecoration(hintText: "Enter the Filter this Price"),
                  onChanged: filterProductByPrice),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: filterProduct.length,
                    itemBuilder: (context, index) {
                      Product pro = filterProduct[index];
                      return Card(
                        child: Slidable(
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (val) {
                                  setState(() {
                                    products.removeAt(index);
                                    filterProduct.removeAt(index);
                                  });
                                },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          //  closeOnScroll: true,
                          child: ListTile(
                            title: Text(pro.name),
                            subtitle: Text(pro.category),
                            trailing: Text(
                              " Rs ${pro.price.toStringAsFixed(2).toString()}",
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Price:"),
                  Text(
                    allPriceByTotal().toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // floatingActionButton: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     FloatingActionButton(
        //       onPressed: () {
        //         setState(() {
        //           products.insert(
        //               4,
        //               ProductModal(
        //                   name: "Product 6",
        //                   category: "Category E",
        //                   price: 50.0));
        //         });
        //       },
        //       child: const Icon(Icons.add),
        //     ),
        //     FloatingActionButton(
        //       onPressed: () {
        //         setState(() {
        //           products.removeAt(3);
        //         });
        //       },
        //       child: const Icon(Icons.delete),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class Product {
  String name;
  double price;
  String category;

  Product({required this.name, required this.category, required this.price});
}
