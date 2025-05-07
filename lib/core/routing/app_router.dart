import 'package:flutter/material.dart';
import '../../features/categories/presentation/screens/categories_screen.dart';

import '../../features/product_details/presentation/ui/screens/product_details_screen.dart';
import '../../features/products/presentation/screens/products_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.categories:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      case Routes.products:
        final categoryName = args as String;
        return MaterialPageRoute(
          builder: (_) => ProductsScreen(category: categoryName),
        );
      case Routes.productDetailsScreen:
        final productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(productId: productId),
        );
      default:
        return null;
    }
  }
}
