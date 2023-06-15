import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/detail/detail_state.dart';
import 'package:flutter_application_1/screens/home/home_page.dart';

class CurrencyRoutes {
  static final CurrencyRoutes _instance = CurrencyRoutes._init();
  static CurrencyRoutes get instance => _instance;
  CurrencyRoutes._init();
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;

    switch (s.name) {
      case "/home":
        return MaterialPageRoute(builder: (ctx) => const HomePage());
      case "/detail":
        return MaterialPageRoute(builder: (ctx) => DetailPage());
    }
  }
}
