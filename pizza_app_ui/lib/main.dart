import 'package:flutter/material.dart';
import 'package:pizza_app_ui/contact.dart';
import 'package:pizza_app_ui/utils/my_routes_utils.dart';
import 'package:pizza_app_ui/views/screen/Home/final_payment_screen.dart';
import 'package:pizza_app_ui/views/screen/Home/order_tracking_screen.dart';
import 'package:pizza_app_ui/views/screen/ProfileScreen/account_information_screen.dart';
import 'package:pizza_app_ui/views/screen/ProfileScreen/change_password_screen.dart';
import 'package:pizza_app_ui/views/screen/ProfileScreen/delivery_screen.dart';
import 'package:pizza_app_ui/views/screen/ProfileScreen/faq_screen.dart';
import 'package:pizza_app_ui/views/screen/ProfileScreen/favourite_screen.dart';
import 'package:pizza_app_ui/views/screen/ProfileScreen/language_screen.dart';
import 'package:pizza_app_ui/views/screen/ProfileScreen/oder_histroy_screen.dart';
import 'package:pizza_app_ui/views/screen/ProfileScreen/payment_card_screen.dart';
import 'package:pizza_app_ui/views/screen/ProfileScreen/payment_method_screen_dart.dart';
import 'package:pizza_app_ui/views/screen/Home/basket_screen.dart';
import 'package:pizza_app_ui/views/screen/Home/campaigns_screens.dart';
import 'package:pizza_app_ui/views/screen/first_screen.dart';
import 'package:pizza_app_ui/views/screen/LoginScreen/forgot_password_screen.dart';
import 'package:pizza_app_ui/views/screen/Home/home_screen.dart';
import 'package:pizza_app_ui/views/screen/json_serialization.dart';
import 'package:pizza_app_ui/views/screen/list_all_function.dart';
import 'package:pizza_app_ui/views/screen/LoginScreen/login_screen.dart';
import 'package:pizza_app_ui/views/screen/Home/my_home_screen.dart';
import 'package:pizza_app_ui/views/screen/new_password_screen.dart';
import 'package:pizza_app_ui/views/screen/Home/notification_screen.dart';
import 'package:pizza_app_ui/views/screen/PizzaScreen/pizza_screen.dart';
import 'package:pizza_app_ui/views/screen/Home/product_details_screen.dart';
import 'package:pizza_app_ui/views/screen/ProfileScreen/profile_screen.dart';
import 'package:pizza_app_ui/views/screen/Home/reward_screen.dart';
import 'package:pizza_app_ui/views/screen/sign_in_screen.dart';
import 'package:pizza_app_ui/views/screen/splash_screen.dart';
import 'package:pizza_app_ui/views/screen/verification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: MyRoutes.splashScreen,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const ListAllFunctionScreen(),
      initialRoute: MyRoutes.homeScreen,
      routes: {
        MyRoutes.splashScreen: (context) => const SplashScreenPage(),
        MyRoutes.firstScreen: (context) => const FirstScreen(),
        MyRoutes.changePasswordScreen: (context) => ChangePasswordScreen(),
        MyRoutes.productDetailsScreen: (context) => const ProductDetailsScreen(),
        MyRoutes.myHomeScreen: (context) => const MyHomeScreen(),
        MyRoutes.profileScreen: (context) => ProfileScreen(),
        MyRoutes.singInScreen: (context) => SignInScreen(),
        MyRoutes.loginScreen: (context) => LoginScreen(),
        MyRoutes.verificationScreen: (context) => VerificationScreen(),
        MyRoutes.homeScreen: (context) => const HomeScreen(),
        MyRoutes.forgotScreen: (context) => ForGotScreen(),
        MyRoutes.pizzaScreen: (context) => const PizzaScreen(),
        MyRoutes.rewardScreen: (context) => const RewardScreen(),
        MyRoutes.campaignsScreen: (context) => const CampaignsScreen(),
        MyRoutes.newPasswordScreen: (context) => NewPasswordScreen(),
        MyRoutes.paymentMethodScreen: (context) => const PaymentMethodScreen(),
        MyRoutes.paymentCardScreen: (context) => const PaymentCardScreen(),
        MyRoutes.accountInformationScreen: (context) => AccountInformationScreen(),
        MyRoutes.listAllFunction: (context) => const ListAllFunctionScreen(),
        MyRoutes.jsonSerialization: (context) => const JsonSerializationScreen(),
        MyRoutes.orderHistoryScreen: (context) => const OrderHistoryScreen(),
        MyRoutes.favouriteScreen: (context) => const FavouriteScreen(),
        MyRoutes.deliveryScreen: (context) => const DeliveryScreen(),
        MyRoutes.notificationScreen: (context) => const NotificationScreen(),
        MyRoutes.basketScreen: (context) => const BasketScreen(),
        MyRoutes.languageScreen: (context) => LanguageScreen(),
        MyRoutes.faqScreen: (context) => const FAQScreen(),
        MyRoutes.finalPaymentScreen: (context) => const FinalPaymentScreen(),
        MyRoutes.orderTrackingScreen: (context) => const OrderTrackingScreen(),
      },
    );
  }
}
