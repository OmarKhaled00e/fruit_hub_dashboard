import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {

    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => AddProductView());
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Page not found'))),
        settings: settings,
      );
  }
}
