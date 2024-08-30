import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:pizza_app_ui/modal/catgory_data_modal.dart';
import 'package:pizza_app_ui/utils/color_utils.dart';
import 'package:pizza_app_ui/utils/image_utils.dart';
import 'package:pizza_app_ui/utils/my_routes_utils.dart';
import 'package:pizza_app_ui/views/screen/Home/campaigns_screens.dart';
import 'package:pizza_app_ui/views/screen/Home/my_home_screen.dart';
import 'package:pizza_app_ui/views/screen/PizzaScreen/pizza_screen.dart';
import 'package:pizza_app_ui/views/screen/ProfileScreen/profile_screen.dart';
import 'package:pizza_app_ui/views/screen/Home/reward_screen.dart';
import '../../widget/custom_bottom_sheet.dart';
import '../../widget/custom_icon_button.dart';
import '../../widget/custom_sign_in_button.dart';
import '../../widget/custom_text_fform_filed.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

PageController pageController = PageController(
  initialPage: 0,
  keepPage: true,
);

final allBanner = [
  Image.asset(
    ImagePath.bannerImage,
  ),
  Image.asset(
    ImagePath.bannerImage,
  ),
  Image.asset(
    ImagePath.bannerImage,
  ),
  Image.asset(
    ImagePath.bannerImage,
  ),
  Image.asset(
    ImagePath.bannerImage,
  ),
];

final Map<String, String> categoryImageMap = {
  'Campaigns': ImagePath.coffeyImage,
  'Pizza': ImagePath.pizzaImage,
  'Starters': ImagePath.coffeyImage,
  'Salads': ImagePath.coffeyImage,
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

List<CategoryData> pizzaList = [
  CategoryData(
      title: "Margherita", subtitle: "Lorem ipsum dolor sit amet.", image: ImagePath.pizzasImage3, price: 5.99),
  CategoryData(title: "Farmhouse", subtitle: "Lorem ipsum dolor sit amet.", image: ImagePath.pizzasImage2, price: 7.99),
  CategoryData(title: "Diavola", subtitle: "Lorem ipsum dolor sit amet.", image: ImagePath.pizzasImage4, price: 5.99),
  CategoryData(
    title: 'Boscaiola',
    subtitle: 'Lorem ipsum dolor sit amet.',
    image: ImagePath.pizzasImage2,
    price: 8.99,
  ),
  CategoryData(title: "Farmhouse", subtitle: "Lorem ipsum dolor sit amet.", image: ImagePath.pizzasImage2, price: 7.99),
];

List<CategoryData> starterList = [
  CategoryData(
      title: "Garlic Bread", subtitle: "Freshly baked garlic bread", image: ImagePath.starterImage, price: 2.99),
  CategoryData(
      title: "Chicken Wings", subtitle: "Spicy and crispy chicken wings", image: ImagePath.starterImage1, price: 4.99),
  CategoryData(title: "Mix Veg", subtitle: "Freshly baked garlic bread", image: ImagePath.starterImage2, price: 2.99),
  CategoryData(
      title: "Garlic Bread", subtitle: "Freshly baked garlic bread", image: ImagePath.starterImage3, price: 2.99),
];

List<CategoryData> saladList = [
  CategoryData(
      title: "Caesar Salad",
      subtitle: "Fresh romaine lettuce with Caesar dressing",
      image: ImagePath.saladImage,
      price: 3.99),
  CategoryData(
      title: "Greek Salad",
      subtitle: "Mixed greens, tomatoes, olives, and feta cheese",
      image: ImagePath.saladImage1,
      price: 4.99),
  CategoryData(
      title: "Caesar Salad",
      subtitle: "Fresh romaine lettuce with Caesar dressing",
      image: ImagePath.saladImage2,
      price: 3.99),
  CategoryData(
      title: "Mix veg Salad",
      subtitle: "Fresh romaine lettuce with Caesar dressing",
      image: ImagePath.saladImage1,
      price: 3.99),
];

int currentIndex = 0;
int selectedIndex = 0;
int bottomSelectedIndex = 0;

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categoryImageMap.length, vsync: this);
    _tabController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              bottomSelectedIndex = index;
            });
          },
          children: [
            const MyHomeScreen(),
            const PizzaScreen(),
            const RewardScreen(),
            const CampaignsScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          width: 386,
          child: BottomNavigationBar(
            backgroundColor: const Color(0xffFFFFFF),
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: const Color(0xff5C616F),
            selectedFontSize: 12,
            unselectedFontSize: 12,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: AppColor.dotIndicator,
            //fixedColor: AppColor.dotIndicator,
            currentIndex: bottomSelectedIndex,
            onTap: (index) {
              setState(() {
                bottomSelectedIndex = index;
                pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(ImagePath.homeImage),
                  height: 28,
                  width: 28,
                  color: (bottomSelectedIndex == 0) ? AppColor.dotIndicator : const Color(0xff5C616F),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage(ImagePath.pizzaBottomImage),
                    height: 28,
                    width: 28,
                    color: (bottomSelectedIndex == 1) ? AppColor.dotIndicator : const Color(0xff5C616F),
                  ),
                  label: "Pizzas"),
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage(ImagePath.rewardImage),
                    height: 28,
                    width: 28,
                    color: (bottomSelectedIndex == 2) ? AppColor.dotIndicator : const Color(0xff5C616F),
                  ),
                  label: "Rewards"),
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage(ImagePath.campaignsImage),
                    height: 28,
                    width: 28,
                    color: (bottomSelectedIndex == 3) ? AppColor.dotIndicator : const Color(0xff5C616F),
                  ),
                  label: "Campaigns"),
              BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage(ImagePath.contactImage),
                    height: 28,
                    width: 28,
                    color: (bottomSelectedIndex == 4) ? AppColor.dotIndicator : const Color(0xff5C616F),
                  ),
                  label: "profile"),
            ],
          ),
        ),
      ),
    );
  }
}
