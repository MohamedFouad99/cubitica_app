import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 8 May 2025
// description: This file contains the AppBarWidget class which represents
// a custom app bar widget in the application.
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  /// Builds the AppBarWidget widget tree.
  ///
  /// This widget builds a CustomAppBar with the title 'Categories' and
  /// applies a bottom left and right radius of 16 to it.
  ///
  /// Returns a ClipRRect widget with the specified border radius and
  /// the CustomAppBar widget as its child.
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      child: const CustomAppBar(title: 'Categories'),
    );
  }
}
