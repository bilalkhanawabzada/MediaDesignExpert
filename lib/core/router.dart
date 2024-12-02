// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:jaat_app/core/router_constants.dart';
import 'package:jaat_app/views/product_list/product_list_view.dart' as product_list;
import 'package:jaat_app/views/order_details/order_details_view.dart' as order_details;


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case productListRoute:
        return MaterialPageRoute(builder: (_) => const product_list.ProductListView());
      case orderDetailsRoute:
        return MaterialPageRoute(builder: (_) => const order_details.OrderDetailsView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
