import 'dart:async';
import 'package:flutter/material.dart';
import 'package:memento/core/theme/color_extensions.dart';
import 'package:memento/core/theme/typography_extensions.dart';
import 'package:memento/features/home/model/domain/revision_rating_type.dart';
import 'package:memento/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class RevisionCard extends StatefulWidget {
  final int id;
  final String title;
  final String? description;
  final String? group;
  final DateTime? revisionDate;
  final DateTime dateCreation;
  final DateTime dateModification;
  final Color? borderHighlightedColor;
  final Color? cardColor;
  final bool showFloatingBadge;

  const RevisionCard({
    super.key,
    required this.id,
    required this.title,
    required this.dateCreation,
    required this.dateModification,
    this.description,
    this.group,
    this.revisionDate,
    this.borderHighlightedColor,
    this.cardColor,
    this.showFloatingBadge = true,
  });

  @override
  State<RevisionCard> createState() => _RevisionCardState();
}

class _RevisionCardState extends State<RevisionCard> {
  late final TextEditingController _textEditingController;
  bool _isExpanded = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorExtensions>()!;
    final typography = Theme.of(context).extension<TypographyExtensions>()!;
    return GestureDetector(
      onDoubleTap: _toggleExpand,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main Card Body
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.all(2.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            decoration: BoxDecoration(
              color: widget.cardColor ?? colors.fillGreySurface,
              borderRadius: BorderRadius.circular(21.0),
              border: Border(
                left: BorderSide(
                  color: widget.borderHighlightedColor ?? colors.borderStrong,
                  width: 3.0,
                ),
                right: BorderSide(
                  color: widget.borderHighlightedColor ?? colors.borderStrong,
                  width: 3.0,
                ),
                top: BorderSide(
                  color: widget.borderHighlightedColor ?? colors.borderStrong,
                  width: 3.0,
                ),
                bottom: BorderSide(
                  color: widget.borderHighlightedColor ?? colors.borderStrong,
                  width: 7.0,
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header (Always Visible)
                GestureDetector(
                  onTap: _toggleExpand,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(widget.title, style: typography.cardTitle),
                      ),
                      Text(
                        "${widget.group ?? ''} • rev: 4 days",
                        style: typography.cardMetadataSecondary,
                      ),
                    ],
                  ),
                ),

                // Collapsible Section
                ClipRect(
                  // Ensures children don't bleed out during animation
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    alignment: Alignment.topCenter,
                    curve: Curves.easeInOut,
                    heightFactor: _isExpanded ? 1.0 : 0.0,
                    child: Column(
                      children: [
                        Divider(color: colors.scaffoldBg, thickness: 4.0),
                        const SizedBox(height: 10.0),
                        _buildDescriptionRow(context, colors, typography),
                        const SizedBox(height: 14.0),
                        _buildRatingRow(colors),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Floating Badge
          if (widget.showFloatingBadge) _buildFloatingBadges(colors),
        ],
      ),
    );
  }

  Widget _buildDescriptionRow(
    BuildContext context,
    ColorExtensions colors,
    TypographyExtensions typography,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: InputDecorationTheme(
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            child: TextField(
              controller: _textEditingController,
              onChanged: (value) {
                if (value.isEmpty) return;
                _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 600), () async {
                  await context.read<HomeViewmodel>().updateNote(
                    widget.id,
                    description: value,
                  );
                });
              },

              minLines: 3,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Add a description...",
                contentPadding: EdgeInsets.zero,
              ),
              style: typography.cardBody,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Image.asset(
          "assets/images/graph.png",
          width: 90.0,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Widget _buildRatingRow(ColorExtensions colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: RevisionRatingType.values.map((rating) {
        return GestureDetector(
          onTap: () {
            context.read<HomeViewmodel>().updateNote(widget.id, rating: rating);
          },
          child: _ratingButton(
            color: rating.bgColor,
            icon: rating.icon,
            borderColor: colors.borderDefault,
            colors: colors,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFloatingBadges(ColorExtensions colors) {
    return Positioned(
      top: 0,
      right: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/mark_green.png", height: 22.0),
          const SizedBox(width: 4),
          Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: colors.softRed,
              shape: BoxShape.circle,
              border: Border.all(color: colors.borderStrong, width: 3.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ratingButton({
    required Color color,
    IconData? icon,
    required Color borderColor,
    required ColorExtensions colors,
  }) {
    return Container(
      width: 60,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.5),
        border: Border(
          top: BorderSide(color: borderColor, width: 4.0),
          left: BorderSide(color: borderColor, width: 4.0),
          right: BorderSide(color: borderColor, width: 4.0),
          bottom: BorderSide(color: borderColor, width: 6.0),
        ),
      ),
      child: Icon(icon, color: colors.textPrimary),
    );
  }
}
