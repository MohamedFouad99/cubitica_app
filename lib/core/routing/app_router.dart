import 'package:flutter/material.dart';
import '../../features/categories/presentation/screens/categories_screen.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.categories:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());

      default:
        return null;
    }
  }
}
