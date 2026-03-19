import 'package:flutter/material.dart';

@immutable
class TypographyExtensions extends ThemeExtension<TypographyExtensions> {
  final TextStyle cardTitle;
  final TextStyle cardMetadataPrimary;
  final TextStyle cardMetadataSecondary;
  final TextStyle cardBody;
  final TextStyle inputField;

  const TypographyExtensions({
    required this.cardTitle,
    required this.cardMetadataPrimary,
    required this.cardMetadataSecondary,
    required this.cardBody,
    required this.inputField,
  });

  @override
  TypographyExtensions copyWith({
    TextStyle? cardTitle,
    TextStyle? cardMetadataPrimary,
    TextStyle? cardMetadataSecondary,
    TextStyle? cardBody,
    TextStyle? inputField,
  }) {
    return TypographyExtensions(
      cardTitle: cardTitle ?? this.cardTitle,
      cardMetadataPrimary: cardMetadataPrimary ?? this.cardMetadataPrimary,
      cardMetadataSecondary:
          cardMetadataSecondary ?? this.cardMetadataSecondary,
      cardBody: cardBody ?? this.cardBody,
      inputField: inputField ?? this.inputField,
    );
  }

  @override
  TypographyExtensions lerp(
    covariant ThemeExtension<TypographyExtensions>? other,
    double t,
  ) {
    if (other is! TypographyExtensions) return this;

    return TypographyExtensions(
      cardTitle: TextStyle.lerp(cardTitle, other.cardTitle, t)!,
      cardMetadataPrimary: TextStyle.lerp(
        cardMetadataPrimary,
        other.cardMetadataPrimary,
        t,
      )!,
      cardMetadataSecondary: TextStyle.lerp(
        cardMetadataSecondary,
        other.cardMetadataSecondary,
        t,
      )!,
      cardBody: TextStyle.lerp(cardBody, other.cardBody, t)!,
      inputField: TextStyle.lerp(inputField, other.inputField, t)!,
    );
  }
}
