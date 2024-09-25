import 'package:flutter/widgets.dart';
import 'package:hive_database_crud/home/home_page_view.dart';

Map<String, WidgetBuilder> get myRoutes => <String, WidgetBuilder>{
      HomePageView.routeName: HomePageView.builder,
    };
