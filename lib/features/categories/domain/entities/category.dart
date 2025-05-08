import 'package:equatable/equatable.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 8 May 2025
// description: This file contains the Category class which represents a category in the application.
class Category extends Equatable {
  final String name;
  const Category({required this.name});
  @override
  List<Object> get props => [name];
}
