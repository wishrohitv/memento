import 'package:flutter/material.dart';
import 'package:memento/core/widgets/image_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset("assets/images/memento.png")),
      body: Container(),
      persistentFooterDecoration: BoxDecoration(
        color: Colors.transparent
      ),
      persistentFooterButtons: [
        SizedBox(
          height: 66.0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12.0,
              children: [
                ImageButton(imagePath: "assets/images/home_tab.png", onTap: () {}),
                ImageButton(imagePath: "assets/images/forest_tab.png", onTap: () {}),
                ImageButton(imagePath: "assets/images/edit_tab.png", onTap: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
