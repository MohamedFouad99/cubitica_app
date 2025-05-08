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
          // Product Title
          Text(
            productDetails.title,
            style: TextStyles.font24BlackBold.copyWith(height: 1.2),
          ),
          verticalSpace(4),
          // Product Price
          Text(
            '\$${productDetails.price}',
            style: TextStyles.font20SecondaryRegular,
          ),
          verticalSpace(18),
          // Product Description
          Text(
            productDetails.description,
            style: TextStyles.font16DarkGrayRegular.copyWith(height: 1.3),
          ),
          verticalSpace(6),
          // Product Images
          SizedBox(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productDetails.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: CachedNetworkImage(
                    imageUrl: productDetails.images[index],
                    fit: BoxFit.cover,
                    width: 180.h,
                    height: 150.h,
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
          verticalSpace(6),
          // Product Details (Additional Info)
          Text('Brand: ${productDetails.brand}'),
          Text('Category: ${productDetails.category}'),
          Text('Stock: ${productDetails.stock}'),
          Text('SKU: ${productDetails.sku}'),
          const SizedBox(height: 16),

          // Rating
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow),
              const SizedBox(width: 4),
              Text('${productDetails.rating} / 5'),
            ],
          ),
          const SizedBox(height: 16),

          // Tags
          Wrap(
            spacing: 8.0,
            children:
                productDetails.tags
                    .map((tag) => Chip(label: Text(tag)))
                    .toList(),
          ),
          const SizedBox(height: 16),

          // Reviews Section
          const SizedBox(height: 16),
          Text(
            'Reviews',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...productDetails.reviews.map((review) => _buildReview(review)),
        ],
      ),
    );
  }

  Widget _buildReview(Review review) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, size: 24),
                const SizedBox(width: 8),
                Text(
                  review.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(review.comment),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 16),
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
