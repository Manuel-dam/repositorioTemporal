// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlumnoStruct extends BaseStruct {
  AlumnoStruct({
    int? id,
    int? carrera,
  })  : _id = id,
        _carrera = carrera;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "carrera" field.
  int? _carrera;
  int get carrera => _carrera ?? 0;
  set carrera(int? val) => _carrera = val;

  void incrementCarrera(int amount) => carrera = carrera + amount;

  bool hasCarrera() => _carrera != null;

  static AlumnoStruct fromMap(Map<String, dynamic> data) => AlumnoStruct(
        id: castToType<int>(data['id']),
        carrera: castToType<int>(data['carrera']),
      );

  static AlumnoStruct? maybeFromMap(dynamic data) =>
      data is Map ? AlumnoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'carrera': _carrera,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'carrera': serializeParam(
          _carrera,
          ParamType.int,
        ),
      }.withoutNulls;

  static AlumnoStruct fromSerializableMap(Map<String, dynamic> data) =>
      AlumnoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        carrera: deserializeParam(
          data['carrera'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AlumnoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AlumnoStruct && id == other.id && carrera == other.carrera;
  }

  @override
  int get hashCode => const ListEquality().hash([id, carrera]);
}

AlumnoStruct createAlumnoStruct({
  int? id,
  int? carrera,
}) =>
    AlumnoStruct(
      id: id,
      carrera: carrera,
    );
