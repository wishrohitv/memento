import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memento/core/theme/color_extensions.dart';
import 'package:memento/features/home/model/ui/input_step.dart';
import 'package:memento/features/home/model/ui/input_form.dart';

class RevisionInput extends StatefulWidget {
  final Function(InputForm revision) onEnter;
  const RevisionInput({super.key, required this.onEnter});

  @override
  State<RevisionInput> createState() => _RevisionInputState();
}

class _RevisionInputState extends State<RevisionInput> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool showThreeDots = true;
  int? stepIndex;

  final List<InputStepModel> steps = [
    InputStepModel(key: "title", hint: "I just finished revising..."),
    InputStepModel(key: "description", hint: "Add a description...[Optional]"),
    InputStepModel(key: "group", hint: "Add a group...[Optional]"),
  ];

  void showDots() {
    setState(() {
      showThreeDots = false;
      stepIndex = 0;
    });
  }

  void addRevisionNote() {
    // Check if title is not empty
    if (stepIndex! == 0 && _textEditingController.text.isEmpty) {
      return;
    }
    steps[stepIndex!].value = _textEditingController.text;

    if (stepIndex! < steps.length - 1) {
      if (stepIndex != null) {
        stepIndex = stepIndex! + 1;
      }
      _textEditingController.clear();
      _focusNode.requestFocus();
    } else {
      showThreeDots = true;
      stepIndex = null;
      _textEditingController.clear();

      // Send submit callback
      widget.onEnter(
        InputForm(
          title: steps[0].value!,
          description: steps[1].value,
          group: steps[2].value,
        ),
      );
    }

    setState(() {});
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 80.0,
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: _textEditingController,
              focusNode: _focusNode,
              onTap: showDots,
              onSubmitted: (value) => addRevisionNote(),
              cursorRadius: const Radius.circular(5),
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoSerif(
                color: Theme.of(
                  context,
                ).extension<ColorExtensions>()!.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                constraints: BoxConstraints(maxHeight: double.maxFinite),
                contentPadding: const EdgeInsets.all(25),
                hintText: stepIndex != null ? steps[stepIndex!].hint : "",
                filled: true,
                fillColor: Theme.of(
                  context,
                ).extension<ColorExtensions>()!.fillGreySurface,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(42),
                  borderSide: BorderSide(
                    color: Theme.of(
                      context,
                    ).extension<ColorExtensions>()!.borderDefault,
                    width: 5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(42),
                  borderSide: BorderSide(
                    color: Theme.of(
                      context,
                    ).extension<ColorExtensions>()!.borderActive,
                    width: 5,
                  ),
                ),
              ),
            ),
          ),

          showThreeDots
              ? Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      // If user clicks on dots then initiate the note creation
                      setState(() {
                        showThreeDots = false;
                        stepIndex = 0;
                        _focusNode.requestFocus();
                      });
                    },
                    child: SizedBox(
                      width: 70.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10.0,
                        children: [
                          Container(
                            height: 16.0,
                            width: 16.0,
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).extension<ColorExtensions>()!.borderActive,
                              borderRadius: BorderRadiusGeometry.circular(50.0),
                            ),
                          ),
                          Container(
                            height: 16.0,
                            width: 16.0,
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).extension<ColorExtensions>()!.borderActive,
                              borderRadius: BorderRadiusGeometry.circular(50.0),
                            ),
                          ),
                          Container(
                            height: 16.0,
                            width: 16.0,
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).extension<ColorExtensions>()!.borderActive,
                              borderRadius: BorderRadiusGeometry.circular(50.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
