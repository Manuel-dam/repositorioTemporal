import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'anadir_alumno_asignatura_widget.dart' show AnadirAlumnoAsignaturaWidget;
import 'package:flutter/material.dart';

class AnadirAlumnoAsignaturaModel
    extends FlutterFlowModel<AnadirAlumnoAsignaturaWidget> {
  ///  Local state fields for this page.

  List<AlumnoStruct> listaAlumnos = [];
  void addToListaAlumnos(AlumnoStruct item) => listaAlumnos.add(item);
  void removeFromListaAlumnos(AlumnoStruct item) => listaAlumnos.remove(item);
  void removeAtIndexFromListaAlumnos(int index) => listaAlumnos.removeAt(index);
  void insertAtIndexInListaAlumnos(int index, AlumnoStruct item) =>
      listaAlumnos.insert(index, item);
  void updateListaAlumnosAtIndex(int index, Function(AlumnoStruct) updateFn) =>
      listaAlumnos[index] = updateFn(listaAlumnos[index]);

  List<AsignaturaStruct> listaAsignaturas = [];
  void addToListaAsignaturas(AsignaturaStruct item) =>
      listaAsignaturas.add(item);
  void removeFromListaAsignaturas(AsignaturaStruct item) =>
      listaAsignaturas.remove(item);
  void removeAtIndexFromListaAsignaturas(int index) =>
      listaAsignaturas.removeAt(index);
  void insertAtIndexInListaAsignaturas(int index, AsignaturaStruct item) =>
      listaAsignaturas.insert(index, item);
  void updateListaAsignaturasAtIndex(
          int index, Function(AsignaturaStruct) updateFn) =>
      listaAsignaturas[index] = updateFn(listaAsignaturas[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - recojerAlumnosTodos] action in AnadirAlumnoAsignatura widget.
  List<dynamic>? alumnos;
  // Stores action output result for [Custom Action - recojerAsignaturasTodos] action in AnadirAlumnoAsignatura widget.
  List<dynamic>? asignaturas;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
