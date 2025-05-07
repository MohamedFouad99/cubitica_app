import 'package:flutter/material.dart';
import 'core/di/di.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

final AppRouter appRouter = AppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubitica',
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: Routes.categories,
    );
  }
}
