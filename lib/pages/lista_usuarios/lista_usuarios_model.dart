import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'lista_usuarios_widget.dart' show ListaUsuariosWidget;
import 'package:flutter/material.dart';

class ListaUsuariosModel extends FlutterFlowModel<ListaUsuariosWidget> {
  ///  Local state fields for this page.

  List<UsuarioStruct> listaUsuarios = [];
  void addToListaUsuarios(UsuarioStruct item) => listaUsuarios.add(item);
  void removeFromListaUsuarios(UsuarioStruct item) =>
      listaUsuarios.remove(item);
  void removeAtIndexFromListaUsuarios(int index) =>
      listaUsuarios.removeAt(index);
  void insertAtIndexInListaUsuarios(int index, UsuarioStruct item) =>
      listaUsuarios.insert(index, item);
  void updateListaUsuariosAtIndex(
          int index, Function(UsuarioStruct) updateFn) =>
      listaUsuarios[index] = updateFn(listaUsuarios[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - recojerTodosUsuarios] action in ListaUsuarios widget.
  List<dynamic>? lista;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Custom Action - recojerTodosUsuarios] action in ChoiceChips widget.
  List<dynamic>? todos;
  // Stores action output result for [Custom Action - recojerAlumnosUsuarios] action in ChoiceChips widget.
  List<dynamic>? alumnos;
  // Stores action output result for [Custom Action - recojerProfesoresUsuarios] action in ChoiceChips widget.
  List<dynamic>? profesores;
  // Stores action output result for [Custom Action - recojerAdminUsuarios] action in ChoiceChips widget.
  List<dynamic>? admins;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
