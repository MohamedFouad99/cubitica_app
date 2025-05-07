import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../cubit/category_cubit.dart';
import '../cubit/category_state.dart';
import '../../../../core/di/di.dart';
import '../../domain/entities/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CategoryCubit>()..fetchCategories(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Categories')),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryFailure) {
              return Center(child: Text(state.failure.message));
            } else if (state is CategoryLoaded) {
              return _buildCategoryList(context, state.categories);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context, List<Category> categories) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: categories.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final category = categories[index];
        return ListTile(
          title: Text(category.name),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.products,
              arguments: category.name,
            );
          },
        );
      },
    );
  }
}
