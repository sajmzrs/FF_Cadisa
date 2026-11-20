// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Datos del servicio activo que se muestran en el detalle.
class ServicioDetalleDatosStruct extends FFFirebaseStruct {
  ServicioDetalleDatosStruct({
    /// ServicioDetalleDatos.titulo
    String? titulo,

    /// ServicioDetalleDatos.categoria
    String? categoria,

    /// ServicioDetalleDatos.descripcion
    String? descripcion,

    /// ServicioDetalleDatos.precio
    String? precio,

    /// ServicioDetalleDatos.duracion
    String? duracion,

    /// ServicioDetalleDatos.residencial
    bool? residencial,

    /// ServicioDetalleDatos.comercial
    bool? comercial,

    /// ServicioDetalleDatos.industrial
    bool? industrial,

    /// ServicioDetalleDatos.inclusiones
    List<String>? inclusiones,

    /// ServicioDetalleDatos.disponible
    bool? disponible,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titulo = titulo,
        _categoria = categoria,
        _descripcion = descripcion,
        _precio = precio,
        _duracion = duracion,
        _residencial = residencial,
        _comercial = comercial,
        _industrial = industrial,
        _inclusiones = inclusiones,
        _disponible = disponible,
        super(firestoreUtilData);

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  set titulo(String? val) => _titulo = val;

  bool hasTitulo() => _titulo != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  set descripcion(String? val) => _descripcion = val;

  bool hasDescripcion() => _descripcion != null;

  // "precio" field.
  String? _precio;
  String get precio => _precio ?? '';
  set precio(String? val) => _precio = val;

  bool hasPrecio() => _precio != null;

  // "duracion" field.
  String? _duracion;
  String get duracion => _duracion ?? '';
  set duracion(String? val) => _duracion = val;

  bool hasDuracion() => _duracion != null;

  // "residencial" field.
  bool? _residencial;
  bool get residencial => _residencial ?? false;
  set residencial(bool? val) => _residencial = val;

  bool hasResidencial() => _residencial != null;

  // "comercial" field.
  bool? _comercial;
  bool get comercial => _comercial ?? false;
  set comercial(bool? val) => _comercial = val;

  bool hasComercial() => _comercial != null;

  // "industrial" field.
  bool? _industrial;
  bool get industrial => _industrial ?? false;
  set industrial(bool? val) => _industrial = val;

  bool hasIndustrial() => _industrial != null;

  // "inclusiones" field.
  List<String>? _inclusiones;
  List<String> get inclusiones => _inclusiones ?? const [];
  set inclusiones(List<String>? val) => _inclusiones = val;

  void updateInclusiones(Function(List<String>) updateFn) {
    updateFn(_inclusiones ??= []);
  }

  bool hasInclusiones() => _inclusiones != null;

  // "disponible" field.
  bool? _disponible;
  bool get disponible => _disponible ?? false;
  set disponible(bool? val) => _disponible = val;

  bool hasDisponible() => _disponible != null;

  static ServicioDetalleDatosStruct fromMap(Map<String, dynamic> data) =>
      ServicioDetalleDatosStruct(
        titulo: data['titulo'] as String?,
        categoria: data['categoria'] as String?,
        descripcion: data['descripcion'] as String?,
        precio: data['precio'] as String?,
        duracion: data['duracion'] as String?,
        residencial: data['residencial'] as bool?,
        comercial: data['comercial'] as bool?,
        industrial: data['industrial'] as bool?,
        inclusiones: getDataList(data['inclusiones']),
        disponible: data['disponible'] as bool?,
      );

  static ServicioDetalleDatosStruct? maybeFromMap(dynamic data) => data is Map
      ? ServicioDetalleDatosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'titulo': _titulo,
        'categoria': _categoria,
        'descripcion': _descripcion,
        'precio': _precio,
        'duracion': _duracion,
        'residencial': _residencial,
        'comercial': _comercial,
        'industrial': _industrial,
        'inclusiones': _inclusiones,
        'disponible': _disponible,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'titulo': serializeParam(
          _titulo,
          ParamType.String,
        ),
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'descripcion': serializeParam(
          _descripcion,
          ParamType.String,
        ),
        'precio': serializeParam(
          _precio,
          ParamType.String,
        ),
        'duracion': serializeParam(
          _duracion,
          ParamType.String,
        ),
        'residencial': serializeParam(
          _residencial,
          ParamType.bool,
        ),
        'comercial': serializeParam(
          _comercial,
          ParamType.bool,
        ),
        'industrial': serializeParam(
          _industrial,
          ParamType.bool,
        ),
        'inclusiones': serializeParam(
          _inclusiones,
          ParamType.String,
          isList: true,
        ),
        'disponible': serializeParam(
          _disponible,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ServicioDetalleDatosStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ServicioDetalleDatosStruct(
        titulo: deserializeParam(
          data['titulo'],
          ParamType.String,
          false,
        ),
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        descripcion: deserializeParam(
          data['descripcion'],
          ParamType.String,
          false,
        ),
        precio: deserializeParam(
          data['precio'],
          ParamType.String,
          false,
        ),
        duracion: deserializeParam(
          data['duracion'],
          ParamType.String,
          false,
        ),
        residencial: deserializeParam(
          data['residencial'],
          ParamType.bool,
          false,
        ),
        comercial: deserializeParam(
          data['comercial'],
          ParamType.bool,
          false,
        ),
        industrial: deserializeParam(
          data['industrial'],
          ParamType.bool,
          false,
        ),
        inclusiones: deserializeParam<String>(
          data['inclusiones'],
          ParamType.String,
          true,
        ),
        disponible: deserializeParam(
          data['disponible'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ServicioDetalleDatosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ServicioDetalleDatosStruct &&
        titulo == other.titulo &&
        categoria == other.categoria &&
        descripcion == other.descripcion &&
        precio == other.precio &&
        duracion == other.duracion &&
        residencial == other.residencial &&
        comercial == other.comercial &&
        industrial == other.industrial &&
        listEquality.equals(inclusiones, other.inclusiones) &&
        disponible == other.disponible;
  }

  @override
  int get hashCode => const ListEquality().hash([
        titulo,
        categoria,
        descripcion,
        precio,
        duracion,
        residencial,
        comercial,
        industrial,
        const ListEquality().hash(inclusiones),
        disponible
      ]);
}

ServicioDetalleDatosStruct createServicioDetalleDatosStruct({
  String? titulo,
  String? categoria,
  String? descripcion,
  String? precio,
  String? duracion,
  bool? residencial,
  bool? comercial,
  bool? industrial,
  bool? disponible,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServicioDetalleDatosStruct(
      titulo: titulo,
      categoria: categoria,
      descripcion: descripcion,
      precio: precio,
      duracion: duracion,
      residencial: residencial,
      comercial: comercial,
      industrial: industrial,
      disponible: disponible,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServicioDetalleDatosStruct? updateServicioDetalleDatosStruct(
  ServicioDetalleDatosStruct? servicioDetalleDatos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    servicioDetalleDatos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServicioDetalleDatosStructData(
  Map<String, dynamic> firestoreData,
  ServicioDetalleDatosStruct? servicioDetalleDatos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (servicioDetalleDatos == null) {
    return;
  }
  if (servicioDetalleDatos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && servicioDetalleDatos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final servicioDetalleDatosData =
      getServicioDetalleDatosFirestoreData(servicioDetalleDatos, forFieldValue);
  final nestedData =
      servicioDetalleDatosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      servicioDetalleDatos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServicioDetalleDatosFirestoreData(
  ServicioDetalleDatosStruct? servicioDetalleDatos, [
  bool forFieldValue = false,
]) {
  if (servicioDetalleDatos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(servicioDetalleDatos.toMap());

  // Add any Firestore field values
  mapToFirestore(servicioDetalleDatos.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServicioDetalleDatosListFirestoreData(
  List<ServicioDetalleDatosStruct>? servicioDetalleDatoss,
) =>
    servicioDetalleDatoss
        ?.map((e) => getServicioDetalleDatosFirestoreData(e, true))
        .toList() ??
    [];
