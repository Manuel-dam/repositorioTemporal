import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';

String mostrarNombreCompleto(
  String nombre,
  String apellidos,
) {
  return nombre + " " + apellidos;
}

List<String> buscarNombresAlumnos(
  List<UsuarioStruct> alumnosUsuarios,
  List<MatriculaStruct> matriculas,
) {
  List<String> resultado = [];

  for (int i = 0; i < matriculas.length; i++) {
    for (int j = 0; j < alumnosUsuarios.length; j++) {
      if (matriculas[i].alumno == alumnosUsuarios[j].id) {
        resultado.add(alumnosUsuarios[j].nombre);
        break;
      }
    }
  }

  return resultado;
}

List<double> buscarNotaConcreta(List<MatriculaStruct> listaMatriculas) {
  List<double> resultado = [];

  for (int i = 0; i < listaMatriculas.length; i++) {
    resultado.add(listaMatriculas[i].nota);
  }

  return resultado;
}
