import 'package:flutter/material.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class HtmlTextField extends StatefulWidget {
  final String? hintText;
  final Color backgroundColor;
  final Color toolbarColor;
  final Color toolbarIconColor;
  final TextStyle? editorTextStyle;
  final TextStyle? hintTextStyle;
  final double minHeight;
  final double? toolbarIconSize;
  final Color? toolbarActiveIconColor;
  final TextEditingController textController;
  const HtmlTextField({
    super.key,
    this.backgroundColor = Colors.white,
    this.toolbarColor = Colors.white,
    this.toolbarIconColor = Colors.black,
    this.toolbarActiveIconColor = Colors.blue,
    required this.textController,
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
    this.toolbarIconSize = 25.0,
    required this.minHeight,
  });

  @override
  State<HtmlTextField> createState() => _HtmlTextFieldState();
}

class _HtmlTextFieldState extends State<HtmlTextField> {
  ///[controller] create a QuillEditorController to access the editor methods
  late QuillEditorController controller;
  @override
  void initState() {
    controller = QuillEditorController();
    if(widget.textController.text.isNotEmpty){
      setHtmlText(widget.textController.text);
    }
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
    return Column(
      children: [
        ToolBar(
          toolBarColor: widget.toolbarColor,
          padding: const EdgeInsets.all(8),
          iconSize: widget.toolbarIconSize,
          iconColor: widget.toolbarIconColor,
          activeIconColor: widget.toolbarActiveIconColor,
          controller: controller,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
        ),
        Expanded(
          child: QuillHtmlEditor(
            // text: widget.textController.text,
            hintText: widget.hintText,
            controller: controller,
            isEnabled: true,
            ensureVisible: false,
            minHeight: widget.minHeight,
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
            onFocusChanged: (focus) {
              debugPrint('has focus $focus');
              setState(() {
                _hasFocus = focus;
              });
            },
            onTextChanged: (text) {
              widget.textController.text = text;
            },
            onEditorCreated: () {
              debugPrint('Editor has been loaded');
            },
            onEditorResized: (height) => debugPrint('Editor resized $height'),
            onSelectionChanged: (sel) =>
                debugPrint('index ${sel.index}, range ${sel.length}'),
          ),
        ),
      ],
    );
  }

  /// method to un focus editor
  void unFocusEditor() => controller.unFocus();
  bool _hasFocus = false;

  ///[getHtmlText] to get the html text from editor
  void getHtmlText() async {
    String? htmlText = await controller.getText();
    debugPrint(htmlText);
  }

  void setHtmlText(String htmlText) async{
   await controller.setText(htmlText);
  }
}
