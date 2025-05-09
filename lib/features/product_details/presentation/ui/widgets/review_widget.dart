import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/style.dart';
import '../../../domain/entities/product_details.dart';
import 'rating_widget.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the ReviewWidget class which is a widget
// that displays a review.
class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key, required this.review});
  final Review review;
  @override
  /// Builds the widget tree for the ReviewWidget.
  ///
  /// This widget displays the username, comment, and rating of a
  /// review. It also displays a divider after the review. The
  /// username is displayed in black bold font, the comment is
  /// displayed in dark gray regular font, the rating is displayed
  /// using the RatingWidget, and the divider is displayed in gray.
  ///
  /// The widget is a column of widgets with the username and icon
  /// first, followed by the comment, the rating, and the divider.
  /// The username and icon are displayed in a row. The comment is
  /// displayed below the username and icon. The rating is displayed
  /// below the comment. The divider is displayed below the rating.
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppAssets.personIcon,
              // ignore: deprecated_member_use
              color: ColorsManager.gray,
              width: 32.w,
            ),
            horizontalSpace(8),
            Text(review.username, style: TextStyles.font14BlackBold),
          ],
        ),
        verticalSpace(4),
        Text(review.comment, style: TextStyles.font14DarkGrayRegular),
        RatingWidget(rating: review.rating),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 36.w),
          child: Divider(color: ColorsManager.gray, thickness: .3, height: 1),
        ),
      ],
    );
  }
}
