import 'package:cached_network_image/cached_network_image.dart';
import '../../../domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/animations/up_down_animation.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/style.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductsListWidgets class which
// represents the widgets for displaying a list of products.
class ProductsListWidgets extends StatelessWidget {
  const ProductsListWidgets({super.key, required this.products});
  final List<Product> products;
  @override
  /// Builds the widget tree for displaying a list of products.
  ///
  /// This widget displays a grid of product cards using a [GridView].
  /// Each card includes an image, title, and price of the product.
  /// An [UpDownAnimation] is applied to the grid, and tapping on a card
  /// navigates to the product details screen with the product's ID as
  /// an argument.
  Widget build(BuildContext context) {
    return UpDownAnimation(
      reverse: true,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 8.w,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.productDetailsScreen,
                arguments: product.id,
              );
            },
            child: Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: product.thumbnail,
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.w,
                      right: 12.w,
                      bottom: 4.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          maxLines: 1,
                          style: TextStyles.font14BlackRegular,
                        ),
                        verticalSpace(2),
                        Text(
                          '\$${product.price}',
                          style: TextStyles.font14BlackBold,
                        ),
                      ],
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
