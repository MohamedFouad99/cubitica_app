import '../../../../../core/di/di.dart';
import '../../../../../core/theming/colors.dart';
import '../widgets/product_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/widgets/app_bar_widget.dart';
import '../../cubit/product_details_cubit.dart';
import '../../cubit/product_details_state.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductDetailsScreen class which represents
// the screen for displaying product details.
class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  /// Builds the widget tree for the ProductDetailsScreen.
  ///
  /// This screen displays product details, utilizing the BLoC pattern
  /// to handle state management. It provides a loading indicator while
  /// product details are being fetched, displays an error message if
  /// fetching fails, and shows the product details once they are
  /// successfully loaded.
  ///
  /// The screen consists of a Scaffold with a custom app bar and a body
  /// that conditionally displays different widgets based on the current
  /// state of the ProductDetailsCubit.
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
              return ProductDetailsWidget(productDetails: state.productDetails);
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }
}
