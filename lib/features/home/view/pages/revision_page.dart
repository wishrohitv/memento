import 'package:flutter/material.dart';
import 'package:memento/features/home/model/domain/group.dart';
import 'package:memento/features/home/model/domain/revision.dart';
import 'package:memento/features/home/view/widgets/group_card.dart';
import 'package:memento/features/home/view/widgets/revision_card.dart';
import 'package:memento/features/home/view/widgets/revision_input.dart';
import 'package:memento/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'package:memento/core/theme/color_extensions.dart';

class RevisionPage extends StatelessWidget {
  const RevisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorExtensions>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      child: Column(
        spacing: 4.0,
        children: [
          SizedBox(height: 10.0),
          Expanded(
            child: Consumer<HomeViewmodel>(
              builder: (BuildContext context, homeVm, Widget? child) {
                final homeFeed = homeVm.homeNoteFeed;
                if (homeVm.revisions.isEmpty) {
                  return Center(
                    child: Text(
                      "No revisions found.",
                      style: TextStyle(color: colors.softOrange),
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: homeFeed.length,
                  separatorBuilder: (context, index) => SizedBox(height: 18.0),
                  itemBuilder: (context, index) {
                    final model = homeFeed[index];
                    if (model.runtimeType == Group) {
                      final group = model as Group;
                      return GroupCard(groupModel: group);
                    }
                    final revisionModel = model as Revision;
                    return Dismissible(
                      key: Key(revisionModel.id.toString()),
                      onDismissed: (direction) {
                        context.read<HomeViewmodel>().delete(revisionModel.id);
                      },
                      child: RevisionCard(
                        id: revisionModel.id,
                        title: revisionModel.title,
                        description: revisionModel.description,
                        group: revisionModel.group,
                        dateCreation: revisionModel.dateCreation,
                        dateModification: revisionModel.dateModification,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          RevisionInput(
            onEnter: (inputForm) async {
              final result = await context.read<HomeViewmodel>().addNote(
                title: inputForm.title,
                description: inputForm.description,
                group: inputForm.group,
              );

              result.fold(
                onSuccess: (_) {},
                onFailure: (error) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(error.message)));
                },
              );
            },
          ),
          SizedBox(height: 6.0),
        ],
      ),
    );
  }
}
