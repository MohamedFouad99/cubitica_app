import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubitica_app/core/di/di.dart';
import 'package:cubitica_app/core/helpers/spacing.dart';
import 'package:cubitica_app/core/theming/colors.dart';
import 'package:cubitica_app/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/widgets/app_bar_widget.dart';
import '../../../domain/entities/product_details.dart';
import '../../cubit/product_details_cubit.dart';
import '../../cubit/product_details_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBarWidget(title: 'Product Details', hasBackButton: true),
      body: BlocProvider(
        create:
            (context) =>
                getIt<ProductDetailsCubit>()..getProductDetails(productId),
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return Center(child: Lottie.asset(AppAssets.loadingGif));
            } else if (state is ProductDetailsError) {
              return Center(child: Text(state.message));
            } else if (state is ProductDetailsLoaded) {
              return _buildProductDetails(state.productDetails);
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }

  Widget _buildProductDetails(ProductDetails productDetails) {
    return SingleChildScrollView(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${productDetails.rating}',
                    style: TextStyles.font14DarkGrayRegular,
                  ),
                  horizontalSpace(4),
                  RatingBarIndicator(
                    rating: productDetails.rating.toDouble(),
                    itemBuilder:
                        (context, index) =>
                            SvgPicture.asset(AppAssets.starIcon),
                    itemCount: 5,
                    itemSize: 14,
                    unratedColor: ColorsManager.gray,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
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
          verticalSpace(18),
          Text('Top Highlights', style: TextStyles.font18BlackBold),
          verticalSpace(4),
          // Info Card
          // Card(
          //   elevation: 4,
          //   color: Colors.white,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(12),
          //   ),

          //   child: Padding(
          //     padding: const EdgeInsets.all(12),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         _infoRow(
          //           Icons.branding_watermark,
          //           'Brand',
          //           productDetails.brand,
          //         ),
          //         _infoRow(Icons.category, 'Category', productDetails.category),
          //         _infoRow(
          //           Icons.inventory_2,
          //           'Stock',
          //           '${productDetails.stock}',
          //         ),
          //         _infoRow(Icons.qr_code, 'SKU', productDetails.sku),
          //       ],
          //     ),
          //   ),
          // ),
          // verticalSpace(20),

          // // Tags
          // Wrap(
          //   spacing: 8,
          //   runSpacing: 4,
          //   children:
          //       productDetails.tags
          //           .map(
          //             (tag) => Chip(
          //               label: Text(tag),
          //               backgroundColor: Colors.blue.shade50,
          //             ),
          //           )
          //           .toList(),
          // ),
          verticalSpace(24),
          // Reviews Section
          Text('Reviews', style: TextStyles.font18BlackBold),
          verticalSpace(8),
          ...productDetails.reviews.map((review) => _buildReview(review)),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade700),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildReview(Review review) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person_outline, size: 24),
                const SizedBox(width: 8),
                Text(
                  review.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(review.comment, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text('${review.rating} / 5'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
