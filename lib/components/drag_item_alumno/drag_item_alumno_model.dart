import '/backend/schema/structs/index.dart';
import '/components/drag_item_alumno/drag_item_alumno_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'drag_item_alumno_widget.dart' show DragItemAlumnoWidget;
import 'package:flutter/material.dart';

class DragItemAlumnoModel extends FlutterFlowModel<DragItemAlumnoWidget> {
  ///  Local state fields for this component.

  UsuarioStruct? usuario;
  void updateUsuarioStruct(Function(UsuarioStruct) updateFn) {
    updateFn(usuario ??= UsuarioStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - recojerProfesorConcreta] action in dragItemAlumno widget.
  dynamic profo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
