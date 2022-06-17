import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/bottom_bar.dart';
import 'package:shopping_app/features/admin/screens/add_product_screen.dart';
import 'package:shopping_app/features/auth/screens/auth_screen.dart';
import 'package:shopping_app/features/home/screens/category_deals_screen.dart';
import 'package:shopping_app/features/home/screens/home_screen.dart';
import 'package:shopping_app/features/home/search/screens/search_screen.dart';
import 'package:shopping_app/features/product_details/screens/porduct_details.dart';
import 'package:shopping_app/models/product.dart';

Route<dynamic> genrateRoute(RouteSettings routeSetting) {
  switch (routeSetting.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const BottomBar());
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSetting, builder: (_) => const AddProductScreen());
    case SearchScreen.routeName:
      var searchQuery = routeSetting.arguments as String;
      return MaterialPageRoute(
        settings: routeSetting,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case CategoryDealsScreen.routeName:
      var category = routeSetting.arguments as String;
      return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => CategoryDealsScreen(
                category: category,
              ));
    case ProductDetailScreen.routeName:
      var product = routeSetting.arguments as Product;
      return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => ProductDetailScreen(
                product: product,
              ));

    default:
      return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => const Scaffold(
                body: Text('Page Not Found'),
              ));
  }
}
