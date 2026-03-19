import 'package:flutter/material.dart';
import 'package:memento/core/theme/color_extensions.dart';
import 'package:memento/core/theme/typography_extensions.dart';
import 'package:memento/features/home/model/domain/group.dart';
import 'package:memento/features/home/view/widgets/revision_card.dart';

class GroupCard extends StatefulWidget {
  final Group groupModel;
  const GroupCard({super.key, required this.groupModel});
  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  bool _isExpanded = false;

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
      onTap: _toggleExpand,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        decoration: BoxDecoration(
          color: colors.fillLightBlueSurface,
          borderRadius: BorderRadius.circular(21.0),
          border: Border(
            left: BorderSide(
              color: _isExpanded
                  ? colors.borderSelectedBlue
                  : colors.borderBlueStrong,
              width: 3.0,
            ),
            right: BorderSide(
              color: _isExpanded
                  ? colors.borderSelectedBlue
                  : colors.borderBlueStrong,
              width: 3.0,
            ),
            top: BorderSide(
              color: _isExpanded
                  ? colors.borderSelectedBlue
                  : colors.borderBlueStrong,
              width: 3.0,
            ),
            bottom: BorderSide(
              color: _isExpanded
                  ? colors.borderSelectedBlue
                  : colors.borderBlueStrong,
              width: 7.0,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header (Always Visible)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 16.0,
                  children: [
                    Text(
                      widget.groupModel.groupName,
                      style: typography.cardTitle,
                    ),
                    Text(
                      "  •  ${widget.groupModel.revisions.length} elements",
                      style: typography.cardMetadataPrimary,
                    ),
                  ],
                ),
                Row(
                  children: [
                    _isExpanded
                        ? SizedBox(
                            height: 40.0,
                            width: 70.0,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Icon(
                                Icons.keyboard_arrow_up_rounded,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 40.0,
                            width: 70.0,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ],
                ),
              ],
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
                  spacing: 4.0,
                  children: widget.groupModel.revisions
                      .map(
                        (revision) => RevisionCard(
                          id: revision.id,
                          title: revision.title,
                          dateCreation: revision.dateCreation,
                          dateModification: revision.dateModification,
                          borderHighlightedColor: colors.borderSelectedBlue,
                          cardColor: colors.fillLightBlueSurface,
                          showFloatingBadge: false,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
