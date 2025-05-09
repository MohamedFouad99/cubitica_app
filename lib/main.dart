import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    bool isTablet = MediaQuery.of(context).size.width > 600;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ScreenUtilInit(
      designSize:
          isTablet
              ? (isLandscape ? const Size(1024, 800) : const Size(768, 1024))
              : isLandscape
              ? const Size(812, 900)
              : const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Cubitica',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.categories,
      ),
    );
  }
}
