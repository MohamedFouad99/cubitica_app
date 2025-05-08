import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/theming/colors.dart';
import '../../cubit/category_cubit.dart';
import '../../cubit/category_state.dart';
import '../../../../../core/di/di.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/category_list_widget.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 8 May 2025
// description: This file contains the CategoriesScreen class which represents
// the screen for displaying categories in the application.
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  /// Builds the widget tree for the CategoriesScreen.
  ///
  /// This screen displays a list of categories, utilizing the BLoC pattern
  /// to handle state management. It provides a loading indicator while
  /// categories are being fetched, displays an error message if fetching
  /// fails, and shows a list of categories once they are successfully loaded.
  ///
  /// The screen consists of a Scaffold with a custom app bar and a body
  /// that conditionally displays different widgets based on the current
  /// state of the CategoryCubit.
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CategoryCubit>()..fetchCategories(),
      child: Scaffold(
        backgroundColor: ColorsManager.white,
        appBar: const AppBarWidget(),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return Center(child: Lottie.asset(AppAssets.loadingGif));
            } else if (state is CategoryFailure) {
              return Center(child: Text(state.failure.message));
            } else if (state is CategoryLoaded) {
              return CategoryListWidget(categories: state.categories);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
