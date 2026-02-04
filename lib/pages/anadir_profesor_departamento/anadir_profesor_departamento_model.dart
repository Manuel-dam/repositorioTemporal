import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'anadir_profesor_departamento_widget.dart'
    show AnadirProfesorDepartamentoWidget;
import 'package:flutter/material.dart';

class AnadirProfesorDepartamentoModel
    extends FlutterFlowModel<AnadirProfesorDepartamentoWidget> {
  ///  Local state fields for this page.

  List<ProfesorStruct> profesores = [];
  void addToProfesores(ProfesorStruct item) => profesores.add(item);
  void removeFromProfesores(ProfesorStruct item) => profesores.remove(item);
  void removeAtIndexFromProfesores(int index) => profesores.removeAt(index);
  void insertAtIndexInProfesores(int index, ProfesorStruct item) =>
      profesores.insert(index, item);
  void updateProfesoresAtIndex(int index, Function(ProfesorStruct) updateFn) =>
      profesores[index] = updateFn(profesores[index]);

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

  // Stores action output result for [Custom Action - recojerDepartamentoTodo] action in AnadirProfesorDepartamento widget.
  List<dynamic>? listaD;
  // Stores action output result for [Custom Action - recojerProfesoresNulos] action in AnadirProfesorDepartamento widget.
  List<dynamic>? listaP;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
