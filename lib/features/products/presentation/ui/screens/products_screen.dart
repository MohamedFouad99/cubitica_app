import 'package:cubitica_app/core/helpers/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/app_bar_widget.dart';
import '../../cubit/products_cubit.dart';
import '../../cubit/products_state.dart';
import '../widgets/products_list_widgets.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ProductsScreen class which represents
// the screen for displaying products.
class ProductsScreen extends StatelessWidget {
  final String category;
  const ProductsScreen({super.key, required this.category});

  @override
  /// Builds the widget tree for the ProductsScreen.
  ///
  /// This screen displays a list of products, utilizing the BLoC pattern
  /// to handle state management. It provides a loading indicator while
  /// products are being fetched, displays an error message if fetching
  /// fails, and shows a list of products once they are successfully loaded.
  ///
  /// The screen consists of a Scaffold with a custom app bar and a body
  /// that conditionally displays different widgets based on the current
  /// state of the ProductsCubit.
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsCubit>()..fetchProducts(category),
      child: Scaffold(
        backgroundColor: ColorsManager.white,
        appBar: AppBarWidget(
          title: 'Products - ${category.beautify()}',
          hasBackButton: true,
        ),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(child: Lottie.asset(AppAssets.loadingGif));
            } else if (state is ProductsLoaded) {
              return ProductsListWidgets(products: state.products);
            } else if (state is ProductsError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
