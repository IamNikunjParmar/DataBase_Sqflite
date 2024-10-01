import 'package:cloud_database_demo/home/add_user_page.dart';
import 'package:cloud_database_demo/login/login_page_view.dart';
import 'package:cloud_database_demo/sign%20In/sing_in_page_view.dart';
import 'package:flutter/cupertino.dart';

import '../home/home_page_view.dart';

Map<String, WidgetBuilder> get myRoutes => <String, WidgetBuilder>{
      HomePageView.routeName: HomePageView.builder,
      SignInPageView.routeName: SignInPageView.builder,
      LoginPageView.routeName: LoginPageView.builder,
    };
