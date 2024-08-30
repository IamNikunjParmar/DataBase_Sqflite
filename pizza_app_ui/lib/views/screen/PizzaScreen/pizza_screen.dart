import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../modal/catgory_data_modal.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/my_routes_utils.dart';
import '../Home/home_screen.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  int selectValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectValue = 0;
  }

  setSelectButton(int val) {
    setState(() {
      selectValue = val;
    });
  }

  final Map<String, String> categoryImageMap = {
    'All Pizzas': ImagePath.pizzaImage,
    'Chicken': ImagePath.chickenImage,
    'Vegetarian': ImagePath.vegImage,
  };

  final List<CategoryData> products = [
    CategoryData(
      title: 'Margherita Pizza',
      subtitle: 'Lorem ipsum dolor sit amet.',
      image: ImagePath.pizzasImage1,
      price: 8.99,
    ),
    CategoryData(
      title: 'Diavola Pizza',
      subtitle: 'Tomato base, mozarella, spicy salami and black olives',
      image: ImagePath.pizzasImage4,
      price: 8.99,
    ),
    CategoryData(
      title: 'Boscaiola Pizza',
      subtitle: 'Lorem ipsum dolor sit amet.',
      image: ImagePath.pizzasImage2,
      price: 8.99,
    ),
    CategoryData(
      title: 'Margherita Pizza',
      subtitle: 'Lorem ipsum dolor sit amet.',
      image: ImagePath.pizzasImage3,
      price: 8.99,
    ),
    CategoryData(
      title: 'Diavola Pizza',
      subtitle: 'Lorem ipsum dolor sit amet.',
      image: ImagePath.pizzasImage4,
      price: 8.99,
    ),
    CategoryData(
      title: 'Boscaiola Pizza',
      subtitle: 'Lorem ipsum dolor sit amet.',
      image: ImagePath.pizzasImage5,
      price: 8.99,
    ),
    CategoryData(
      title: 'Margherita Pizza',
      subtitle: 'Lorem ipsum dolor sit amet.',
      image: ImagePath.pizzasImage1,
      price: 8.99,
    ),
    CategoryData(
      title: 'Boscaiola Pizza',
      subtitle: 'Lorem ipsum dolor sit amet.',
      image: ImagePath.pizzasImage3,
      price: 8.99,
    ),
  ];

  List<CategoryData> chickenList = [
    CategoryData(
        title: "Margherita", subtitle: "Lorem ipsum dolor sit amet.", image: ImagePath.pizzasImage3, price: 5.99),
    CategoryData(
        title: "Farmhouse", subtitle: "Lorem ipsum dolor sit amet.", image: ImagePath.pizzasImage2, price: 7.99),
    CategoryData(title: "Diavola", subtitle: "Lorem ipsum dolor sit amet.", image: ImagePath.pizzasImage4, price: 5.99),
    CategoryData(
      title: 'Boscaiola',
      subtitle: 'Lorem ipsum dolor sit amet.',
      image: ImagePath.pizzasImage2,
      price: 8.99,
    ),
    CategoryData(
        title: "Farmhouse", subtitle: "Lorem ipsum dolor sit amet.", image: ImagePath.pizzasImage2, price: 7.99),
  ];

  List<CategoryData> vegList = [
    CategoryData(
        title: "Garlic Bread", subtitle: "Freshly baked garlic bread", image: ImagePath.starterImage, price: 2.99),
    CategoryData(
        title: "Chicken Wings",
        subtitle: "Spicy and crispy chicken wings",
        image: ImagePath.starterImage1,
        price: 4.99),
    CategoryData(title: "Mix Veg", subtitle: "Freshly baked garlic bread", image: ImagePath.starterImage2, price: 2.99),
    CategoryData(
        title: "Garlic Bread", subtitle: "Freshly baked garlic bread", image: ImagePath.starterImage3, price: 2.99),
    CategoryData(
        title: "Chicken Wings",
        subtitle: "Spicy and crispy chicken wings",
        image: ImagePath.starterImage1,
        price: 4.99),
    CategoryData(
        title: "Garlic Bread", subtitle: "Freshly baked garlic bread", image: ImagePath.starterImage, price: 2.99),
  ];

  List<CategoryData> getSelectedCategoryList() {
    switch (selectedIndex) {
      case 0:
        return products;
      case 1:
        return chickenList;
      case 2:
        return vegList;
      default:
        return products;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColorScreen,
      appBar: AppBar(
        backgroundColor: AppColor.bgColorScreen,
        title: const Text(
          "PizzaScreen",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff0A0D14),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MyRoutes.homeScreen);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45,
                  width: 165,
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border.all(
                      color: (selectValue == 1) ? AppColor.dotIndicator : AppColor.borderBgColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Radio(
                        activeColor: (selectValue == 1) ? AppColor.dotIndicator : AppColor.borderBgColor,
                        value: 1,
                        groupValue: selectValue,
                        onChanged: (val) {
                          setSelectButton(val!);
                        },
                      ),
                      const Text(
                        "Delivery",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                // const Gap(20),
                Container(
                  height: 45,
                  width: 165,
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border.all(
                      color: (selectValue == 2) ? AppColor.dotIndicator : AppColor.borderBgColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Radio(
                        activeColor: (selectValue == 2) ? AppColor.dotIndicator : AppColor.borderBgColor,
                        value: 2,
                        groupValue: selectValue,
                        onChanged: (val) {
                          setSelectButton(val!);
                        },
                      ),
                      const Text(
                        "Pick Up",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(24),
            const Text(
              "All Products",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryImageMap.entries
                    .map(
                      (entry) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = categoryImageMap.keys.toList().indexOf(entry.key);
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 132,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: selectedIndex == categoryImageMap.keys.toList().indexOf(entry.key)
                                ? AppColor.dotIndicator
                                : Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                entry.value,
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                entry.key,
                                style: TextStyle(
                                  color: selectedIndex == categoryImageMap.keys.toList().indexOf(entry.key)
                                      ? Colors.white
                                      : AppColor.dotIndicator,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 445,
                      width: 500,
                      child: ListView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: getSelectedCategoryList().length,
                        itemBuilder: (context, index) {
                          CategoryData pro = getSelectedCategoryList()[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(MyRoutes.productDetailsScreen, arguments: pro);
                            },
                            child: Container(
                              height: 104,
                              width: 386,
                              margin: const EdgeInsets.only(top: 10),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(
                                      height: 72,
                                      width: 72,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(pro.image),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade700,
                                            offset: const Offset(0, 4),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                    title: Transform.translate(
                                      offset: const Offset(5, -12),
                                      child: Text(
                                        pro.title,
                                        style: const TextStyle(
                                          color: Color(0xff222226),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    subtitle: Transform.translate(
                                      offset: const Offset(5, -12),
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        pro.subtitle,
                                        style: const TextStyle(
                                          color: Color(0xff75757C),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    trailing: Transform.translate(
                                      offset: const Offset(15, 30),
                                      child: InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.add_circle_outline_rounded,
                                          color: AppColor.dotIndicator,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 92,
                                      ),
                                      Transform.translate(
                                        offset: const Offset(15, -18),
                                        child: Text(
                                          "£${pro.price.toString()}",
                                          style: const TextStyle(
                                            color: AppColor.dotIndicator,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 25,
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
          ],
        ),
      ),
    );
  }
}
