import 'package:flutter/material.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class HtmlContainerView extends StatefulWidget {
  final String? displayText;
  final String? hintText;
  final Color backgroundColor;
  final TextStyle? editorTextStyle;
  final TextStyle? hintTextStyle;
  const HtmlContainerView({
    super.key,
    this.displayText,
    this.backgroundColor = Colors.white,
    this.hintTextStyle = const TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 20.0,
      color: Colors.black87,
      fontWeight: FontWeight.normal,
    ),
    this.editorTextStyle = const TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 20.0,
      color: Colors.black87,
      fontWeight: FontWeight.normal,
    ),
    this.hintText,
  });

  @override
  State<HtmlContainerView> createState() => _HtmlContainerViewState();
}

class _HtmlContainerViewState extends State<HtmlContainerView> {
  ///[controller] create a QuillEditorController to access the editor methods
  late QuillEditorController controller;
  @override
  void initState() {
    controller = QuillEditorController();
    super.initState();
  }

  @override
  void dispose() {
    /// please do not forget to dispose the controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: QuillHtmlEditor(
        text: widget.displayText,
        hintText: widget.hintText,
        controller: controller,
        isEnabled: false,
        ensureVisible: true,
        minHeight: 200,
        autoFocus: false,
        textStyle: widget.editorTextStyle,
        hintTextStyle: widget.hintTextStyle,
        hintTextAlign: TextAlign.start,
        padding: const EdgeInsets.only(left: 10, top: 10),
        hintTextPadding: const EdgeInsets.only(left: 20),
        backgroundColor: widget.backgroundColor,
        inputAction: InputAction.newline,
        onEditingComplete: (s) => debugPrint('Editing completed $s'),
        loadingBuilder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 1,
            color: Colors.red,
          ));
        },
        onTextChanged: (text) => debugPrint('widget text change $text'),
        onEditorCreated: () {
          debugPrint('Editor has been loaded');
        },
        onEditorResized: (height) => debugPrint('Editor resized $height'),
        onSelectionChanged: (sel) =>
            debugPrint('index ${sel.index}, range ${sel.length}'),
      ),
    );
  }
}
