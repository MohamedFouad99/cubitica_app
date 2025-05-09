import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/style.dart';

// date: 8 May 2025
// by: Fouad
// last modified at: 9 May 2025
// description: This file contains the HighLightItemWidget class which
// is a widget that displays a title and description for a product highlight.
class HighLightItemWidget extends StatelessWidget {
  const HighLightItemWidget({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  @override
  /// Builds the widget tree for the HighLightItemWidget.
  ///
  /// This widget displays a row with two Text widgets. The first Text widget
  /// displays the title of the highlight with a width of 80 logical pixels and
  /// a font with a size of 14, black color, and bold weight. The second Text
  /// widget displays the description of the highlight with a font with a size
  /// of 14, dark gray color, and regular weight. The two Text widgets are
  /// separated by a horizontal space of 48 logical pixels.
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80.w,
          child: Text(title, style: TextStyles.font14BlackBold),
        ),
        horizontalSpace(48),
        Text(description, style: TextStyles.font14DarkGrayRegular),
      ],
    );
  }
}
