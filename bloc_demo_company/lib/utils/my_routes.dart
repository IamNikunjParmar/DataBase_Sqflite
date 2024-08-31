import 'package:bloc_demo_company/DetailsPage/details_Page_view.dart';
import 'package:flutter/cupertino.dart';
import '../homePage/home_page_view.dart';

Map<String, WidgetBuilder> get myRoutes => <String, WidgetBuilder>{
      HomePageView.routeName: HomePageView.builder,
      DetailsPageView.routeName: DetailsPageView.builder,
    };
