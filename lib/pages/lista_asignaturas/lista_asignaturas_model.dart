import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lista_asignaturas_widget.dart' show ListaAsignaturasWidget;
import 'package:flutter/material.dart';

class ListaAsignaturasModel extends FlutterFlowModel<ListaAsignaturasWidget> {
  ///  Local state fields for this page.

  List<AsignaturaStruct> asignaturas = [];
  void addToAsignaturas(AsignaturaStruct item) => asignaturas.add(item);
  void removeFromAsignaturas(AsignaturaStruct item) => asignaturas.remove(item);
  void removeAtIndexFromAsignaturas(int index) => asignaturas.removeAt(index);
  void insertAtIndexInAsignaturas(int index, AsignaturaStruct item) =>
      asignaturas.insert(index, item);
  void updateAsignaturasAtIndex(
          int index, Function(AsignaturaStruct) updateFn) =>
      asignaturas[index] = updateFn(asignaturas[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - recojerAsignaturasTodo] action in ListaAsignaturas widget.
  List<dynamic>? lista;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
