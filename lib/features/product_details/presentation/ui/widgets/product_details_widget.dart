import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/animations/up_down_animation.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/helpers/string_extensions.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/style.dart';
import '../../../domain/entities/product_details.dart';
import 'high_light_item_widget.dart';
import 'rating_widget.dart';
import 'review_widget.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductDetailsWidget class which
// is a widget that displays product details.
class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key, required this.productDetails});
  final ProductDetails productDetails;
  @override
  /// Builds the widget tree for displaying a product's details.
  ///
  /// This widget is a scrollable column of widgets that displays the product's
  /// title, price, images, description, top highlights, and reviews. The
  /// UpDownAnimation is applied to the column to animate the widgets when
  /// they are displayed. The product's details are displayed in a scrollable
  /// column, with a horizontal image carousel, a description, top highlights,
  Widget build(BuildContext context) {
    return UpDownAnimation(
      reverse: true,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    productDetails.title,
                    style: TextStyles.font18BlackBold.copyWith(height: 1.2),
                  ),
                ),
                horizontalSpace(6),
                // Rating
                RatingWidget(rating: productDetails.rating),
              ],
            ),
            verticalSpace(6),
            // Price
            Text(
              '\$${productDetails.price}',
              style: TextStyles.font20SecondaryBold,
            ),
            verticalSpace(16),
            // Horizontal Image Carousel
            SizedBox(
              height: 220.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: productDetails.images.length,
                separatorBuilder: (_, __) => SizedBox(width: 12.w),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: productDetails.images[index],
                      width: 180.h,
                      height: 220.h,
                      fit: BoxFit.cover,
                      placeholder:
                          (context, url) => Center(
                            child: Lottie.asset(AppAssets.imageLoadingGif),
                          ),
                      errorWidget:
                          (context, url, error) =>
                              const Icon(Icons.broken_image_outlined),
                    ),
                  );
                },
              ),
            ),
            verticalSpace(18),
            // Description
            Text('Description', style: TextStyles.font18BlackBold),
            verticalSpace(4),
            Text(
              productDetails.description,
              style: TextStyles.font16DarkGrayRegular.copyWith(height: 1.4),
            ),
            verticalSpace(16),
            Divider(color: ColorsManager.gray, thickness: .3, height: 1),
            verticalSpace(16),
            Text('Top Highlights', style: TextStyles.font18BlackBold),
            verticalSpace(12),
            HighLightItemWidget(
              title: 'Brand Name',
              description: productDetails.brand.beautify(),
            ),
            verticalSpace(6),
            HighLightItemWidget(
              title: 'Category',
              description: productDetails.category.beautify(),
            ),
            verticalSpace(6),
            HighLightItemWidget(
              title: 'Stock',
              description: '${productDetails.stock}',
            ),
            verticalSpace(6),
            HighLightItemWidget(title: 'SKU', description: productDetails.sku),
            verticalSpace(6),
            HighLightItemWidget(
              title: 'Tags',
              description: productDetails.tags
                  .map((e) => e.beautify())
                  .join(', '),
            ),
            verticalSpace(16),
            Divider(color: ColorsManager.gray, thickness: .3, height: 1),
            verticalSpace(16),
            // Reviews Section
            Text('Reviews', style: TextStyles.font18BlackBold),
            verticalSpace(8),
            ...productDetails.reviews.map(
              (review) => ReviewWidget(review: review),
            ),
          ],
        ),
      ),
    );
  }
}
