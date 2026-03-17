import 'package:flutter/material.dart';
import 'package:memento/core/theme/color_extensions.dart';
import 'package:memento/core/widgets/image_button.dart';
import 'package:memento/features/home/view/pages/revision_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [RevisionPage()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorExtensions>()!;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/memento.png"),
        backgroundColor: colors.fillGreySurface,
      ),

      body: IndexedStack(index: currentIndex, children: pages),
      persistentFooterDecoration: BoxDecoration(color: Colors.transparent),
      persistentFooterButtons: [
        SizedBox(
          height: 66.0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12.0,
              children: [
                ImageButton(
                  imagePath: "assets/images/home_tab.png",
                  onTap: () {},
                ),
                ImageButton(
                  imagePath: "assets/images/forest_tab.png",
                  onTap: () {},
                ),
                ImageButton(
                  imagePath: "assets/images/edit_tab.png",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
