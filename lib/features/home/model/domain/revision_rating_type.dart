import 'package:flutter/material.dart';
import 'package:memento/core/theme/base_colors.dart';

enum RevisionRatingType { poor, fair, good, excellent }

extension RevisionRatingExtension on RevisionRatingType {
  // Returns a user-friendly string for the UI
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

  // Returns a color consistent with standard design systems
  Color get bgColor {
    switch (this) {
      case RevisionRatingType.poor:
        return BaseColors.softRed; // Red
      case RevisionRatingType.fair:
        return BaseColors.softOrange; // Orange
      case RevisionRatingType.good:
        return BaseColors.limeGreen; // Light Green
      case RevisionRatingType.excellent:
        return BaseColors.teal; // Sky blue
    }
  }

  // Returns a color consistent with standard design systems
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
