import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tarjeta_asignatura_widget.dart' show TarjetaAsignaturaWidget;
import 'package:flutter/material.dart';

class TarjetaAsignaturaModel extends FlutterFlowModel<TarjetaAsignaturaWidget> {
  ///  Local state fields for this component.

  UsuarioStruct? profe;
  void updateProfeStruct(Function(UsuarioStruct) updateFn) {
    updateFn(profe ??= UsuarioStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - recojerProfesorConcreta] action in tarjetaAsignatura widget.
  dynamic prof;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
