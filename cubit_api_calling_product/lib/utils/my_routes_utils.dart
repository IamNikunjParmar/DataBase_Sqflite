import 'package:cubit_api_calling_product/cartCubit/cart_page_view.dart';
import 'package:cubit_api_calling_product/detailPage/details_page_view.dart';
import 'package:cubit_api_calling_product/home%20Cubit/home_page_view.dart';
import 'package:cubit_api_calling_product/view/home/home_page_view.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> get myRoutes => <String, WidgetBuilder>{
      HomePageView.routeName: HomePageView.builder,
      HomePAgeViewCubit.routeName: HomePAgeViewCubit.builder,
      DetailsPageView.routeName: DetailsPageView.builder,
      CartPageView.routeName: CartPageView.builder,
    };
