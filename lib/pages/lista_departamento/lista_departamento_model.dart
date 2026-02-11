import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lista_departamento_widget.dart' show ListaDepartamentoWidget;
import 'package:flutter/material.dart';

class ListaDepartamentoModel extends FlutterFlowModel<ListaDepartamentoWidget> {
  ///  Local state fields for this page.

  List<DepartamentoStruct> departamentos = [];
  void addToDepartamentos(DepartamentoStruct item) => departamentos.add(item);
  void removeFromDepartamentos(DepartamentoStruct item) =>
      departamentos.remove(item);
  void removeAtIndexFromDepartamentos(int index) =>
      departamentos.removeAt(index);
  void insertAtIndexInDepartamentos(int index, DepartamentoStruct item) =>
      departamentos.insert(index, item);
  void updateDepartamentosAtIndex(
          int index, Function(DepartamentoStruct) updateFn) =>
      departamentos[index] = updateFn(departamentos[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - recojerTodosDepartamentos] action in ListaDepartamento widget.
  List<dynamic>? lista;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
