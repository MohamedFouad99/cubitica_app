import 'package:cubitica_app/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_details.dart';
import '../../cubit/product_details_cubit.dart';
import '../../cubit/product_details_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: BlocProvider(
        create:
            (context) =>
                getIt<ProductDetailsCubit>()..getProductDetails(productId),
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Title
          Text(
            productDetails.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Product Price
          Text(
            '\$${productDetails.price}',
            style: const TextStyle(fontSize: 20, color: Colors.green),
          ),
          const SizedBox(height: 16),

          // Product Description
          Text(
            productDetails.description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),

          // Product Images (Carousel/Gallery)
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productDetails.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    productDetails.images[index],
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

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
