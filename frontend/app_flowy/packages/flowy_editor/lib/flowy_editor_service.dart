import 'package:flowy_editor/flowy_keyboard_service.dart';
import 'package:flowy_editor/flowy_selection_service.dart';

import 'editor_state.dart';
import 'package:flutter/material.dart';

class FlowyEditor extends StatefulWidget {
  const FlowyEditor({
    Key? key,
    required this.editorState,
    required this.keyEventHandler,
  }) : super(key: key);

  final EditorState editorState;
  final List<FlowyKeyEventHandler> keyEventHandler;

  @override
  State<FlowyEditor> createState() => _FlowyEditorState();
}

class _FlowyEditorState extends State<FlowyEditor> {
  EditorState get editorState => widget.editorState;

  @override
  Widget build(BuildContext context) {
    return FlowySelectionWidget(
      editorState: editorState,
      child: FlowyKeyboardWidget(
        handlers: [
          flowyDeleteNodesHandler,
          ...widget.keyEventHandler,
        ],
        editorState: editorState,
        child: editorState.build(context),
      ),
    );
  }
}
