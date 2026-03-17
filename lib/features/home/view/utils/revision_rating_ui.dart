import 'package:flutter/material.dart';
import 'package:memento/core/theme/base_colors.dart';
import 'package:memento/features/home/model/domain/revision_rating_type.dart';

extension RevisionRatingUI on RevisionRatingType {
  String get label {
    switch (this) {
      case RevisionRatingType.poor:
        return 'Poor';
      case RevisionRatingType.fair:
        return 'Fair';
      case RevisionRatingType.good:
        return 'Good';
      case RevisionRatingType.excellent:
        return 'Excellent';
    }
  }

  Color get bgColor {
    switch (this) {
      case RevisionRatingType.poor:
        return BaseColors.softRed;
      case RevisionRatingType.fair:
        return BaseColors.softOrange;
      case RevisionRatingType.good:
        return BaseColors.limeGreen;
      case RevisionRatingType.excellent:
        return BaseColors.teal;
    }
  }

  IconData? get icon {
    switch (this) {
      case RevisionRatingType.poor:
        return Icons.thumb_down_alt;
      case RevisionRatingType.fair:
        return null;
      case RevisionRatingType.good:
        return null;
      case RevisionRatingType.excellent:
        return Icons.thumb_up_alt;
    }
  }
}
