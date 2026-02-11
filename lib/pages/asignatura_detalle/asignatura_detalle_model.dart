import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'asignatura_detalle_widget.dart' show AsignaturaDetalleWidget;
import 'package:flutter/material.dart';

class AsignaturaDetalleModel extends FlutterFlowModel<AsignaturaDetalleWidget> {
  ///  Local state fields for this page.

  int eleccion = 0;

  List<MatriculaStruct> listaMatriculas = [];
  void addToListaMatriculas(MatriculaStruct item) => listaMatriculas.add(item);
  void removeFromListaMatriculas(MatriculaStruct item) =>
      listaMatriculas.remove(item);
  void removeAtIndexFromListaMatriculas(int index) =>
      listaMatriculas.removeAt(index);
  void insertAtIndexInListaMatriculas(int index, MatriculaStruct item) =>
      listaMatriculas.insert(index, item);
  void updateListaMatriculasAtIndex(
          int index, Function(MatriculaStruct) updateFn) =>
      listaMatriculas[index] = updateFn(listaMatriculas[index]);

  List<String> listaNombres = [];
  void addToListaNombres(String item) => listaNombres.add(item);
  void removeFromListaNombres(String item) => listaNombres.remove(item);
  void removeAtIndexFromListaNombres(int index) => listaNombres.removeAt(index);
  void insertAtIndexInListaNombres(int index, String item) =>
      listaNombres.insert(index, item);
  void updateListaNombresAtIndex(int index, Function(String) updateFn) =>
      listaNombres[index] = updateFn(listaNombres[index]);

  List<double> listaNotas = [];
  void addToListaNotas(double item) => listaNotas.add(item);
  void removeFromListaNotas(double item) => listaNotas.remove(item);
  void removeAtIndexFromListaNotas(int index) => listaNotas.removeAt(index);
  void insertAtIndexInListaNotas(int index, double item) =>
      listaNotas.insert(index, item);
  void updateListaNotasAtIndex(int index, Function(double) updateFn) =>
      listaNotas[index] = updateFn(listaNotas[index]);

  List<UsuarioStruct> listaAlumnos = [];
  void addToListaAlumnos(UsuarioStruct item) => listaAlumnos.add(item);
  void removeFromListaAlumnos(UsuarioStruct item) => listaAlumnos.remove(item);
  void removeAtIndexFromListaAlumnos(int index) => listaAlumnos.removeAt(index);
  void insertAtIndexInListaAlumnos(int index, UsuarioStruct item) =>
      listaAlumnos.insert(index, item);
  void updateListaAlumnosAtIndex(int index, Function(UsuarioStruct) updateFn) =>
      listaAlumnos[index] = updateFn(listaAlumnos[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - recojerMatricucaConcreta] action in AsignaturaDetalle widget.
  List<dynamic>? matriculasJ;
  // Stores action output result for [Custom Action - recojerAlumnosUsuarios] action in AsignaturaDetalle widget.
  List<dynamic>? alumnosJ;
  // Stores action output result for [Custom Action - generarPDF] action in Button widget.
  FFUploadedFile? pdfs;
  bool isDataUploading_uploadDataMl3 = false;
  FFUploadedFile uploadedLocalFile_uploadDataMl3 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataMl3 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
