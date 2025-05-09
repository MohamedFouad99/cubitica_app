import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/style.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the RatingWidget class which is a
// widget that displays a rating and its stars.
class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating});
  final double rating;
  @override
  /// Builds the widget tree for the RatingWidget.
  ///
  /// This widget displays the rating with its stars. The rating
  /// is displayed as a text and then the stars are displayed. The
  /// stars are displayed using the RatingBarIndicator widget.
  ///
  /// The row is center aligned both horizontally and vertically. The
  /// rating is displayed with a font size of 14 and a gray color.
  /// The stars are displayed with a size of 14 and a gray color
  /// for the unrated color. The direction of the stars is
  /// horizontal.
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('$rating', style: TextStyles.font14DarkGrayRegular),
        horizontalSpace(4),
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, index) => SvgPicture.asset(AppAssets.starIcon),
          itemCount: 5,
          itemSize: 14,
          unratedColor: ColorsManager.gray,
          direction: Axis.horizontal,
        ),
      ],
    );
  }
}
