import 'package:cubitica_app/core/helpers/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/animations/up_down_animation.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/style.dart';
import '../../../domain/entities/category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 8 May 2025
// description: This file contains the CategoryListWidget class which represents
class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key, required this.categories});
  final List<Category> categories;

  @override
  /// Builds the widget tree for the CategoryListWidget.
  ///
  /// This widget is a grid view of categories. It uses an UpDownAnimation to
  /// animate the widgets when they are displayed. Each category is a Card widget
  /// with a rounded rectangle shape and a white background. The category image
  /// is displayed on top of the card, and the category name is displayed at the
  /// bottom of the card. When a category is tapped, it navigates to the
  /// ProductsScreen with the category name as an argument.
  Widget build(BuildContext context) {
    return UpDownAnimation(
      reverse: true,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 8.w,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          final imageUrl = Constants.categoryImages[category.name];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.products,
                arguments: category.name,
              );
            },
            child: Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl ?? '',
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => Center(
                              child: Lottie.asset(AppAssets.imageLoadingGif),
                            ),
                        errorWidget:
                            (context, url, error) =>
                                const Icon(Icons.broken_image_outlined),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 2.w,
                      right: 2.w,
                      bottom: 4.h,
                    ),
                    child: Text(
                      maxLines: 1,
                      category.name.beautify(),
                      textAlign: TextAlign.center,
                      style: TextStyles.font14BlackBold.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
