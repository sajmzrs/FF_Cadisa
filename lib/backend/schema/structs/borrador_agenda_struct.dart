// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart' hide Type;

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// DSL struct BorradorAgenda
class BorradorAgendaStruct extends FFFirebaseStruct {
  BorradorAgendaStruct({
    /// BorradorAgenda.servicioRef
    DocumentReference? servicioRef,

    /// BorradorAgenda.tipoInmueble
    String? tipoInmueble,

    /// BorradorAgenda.areaCantidad
    double? areaCantidad,

    /// BorradorAgenda.direccion
    String? direccion,

    /// BorradorAgenda.detalles
    String? detalles,

    /// BorradorAgenda.fotos
    List<String>? fotos,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _servicioRef = servicioRef,
        _tipoInmueble = tipoInmueble,
        _areaCantidad = areaCantidad,
        _direccion = direccion,
        _detalles = detalles,
        _fotos = fotos,
        super(firestoreUtilData);

  // "servicioRef" field.
  DocumentReference? _servicioRef;
  DocumentReference? get servicioRef => _servicioRef;
  set servicioRef(DocumentReference? val) => _servicioRef = val;

  bool hasServicioRef() => _servicioRef != null;

  // "tipoInmueble" field.
  String? _tipoInmueble;
  String get tipoInmueble => _tipoInmueble ?? '';
  set tipoInmueble(String? val) => _tipoInmueble = val;

  bool hasTipoInmueble() => _tipoInmueble != null;

  // "areaCantidad" field.
  double? _areaCantidad;
  double get areaCantidad => _areaCantidad ?? 0.0;
  set areaCantidad(double? val) => _areaCantidad = val;

  void incrementAreaCantidad(double amount) =>
      areaCantidad = areaCantidad + amount;

  bool hasAreaCantidad() => _areaCantidad != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  set direccion(String? val) => _direccion = val;

  bool hasDireccion() => _direccion != null;

  // "detalles" field.
  String? _detalles;
  String get detalles => _detalles ?? '';
  set detalles(String? val) => _detalles = val;

  bool hasDetalles() => _detalles != null;

  // "fotos" field.
  List<String>? _fotos;
  List<String> get fotos => _fotos ?? const [];
  set fotos(List<String>? val) => _fotos = val;

  void updateFotos(Function(List<String>) updateFn) {
    updateFn(_fotos ??= []);
  }

  bool hasFotos() => _fotos != null;

  static BorradorAgendaStruct fromMap(Map<String, dynamic> data) =>
      BorradorAgendaStruct(
        servicioRef: data['servicioRef'] as DocumentReference?,
        tipoInmueble: data['tipoInmueble'] as String?,
        areaCantidad: castToType<double>(data['areaCantidad']),
        direccion: data['direccion'] as String?,
        detalles: data['detalles'] as String?,
        fotos: getDataList(data['fotos']),
      );

  static BorradorAgendaStruct? maybeFromMap(dynamic data) => data is Map
      ? BorradorAgendaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'servicioRef': _servicioRef,
        'tipoInmueble': _tipoInmueble,
        'areaCantidad': _areaCantidad,
        'direccion': _direccion,
        'detalles': _detalles,
        'fotos': _fotos,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'servicioRef': serializeParam(
          _servicioRef,
          ParamType.DocumentReference,
        ),
        'tipoInmueble': serializeParam(
          _tipoInmueble,
          ParamType.String,
        ),
        'areaCantidad': serializeParam(
          _areaCantidad,
          ParamType.double,
        ),
        'direccion': serializeParam(
          _direccion,
          ParamType.String,
        ),
        'detalles': serializeParam(
          _detalles,
          ParamType.String,
        ),
        'fotos': serializeParam(
          _fotos,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static BorradorAgendaStruct fromSerializableMap(Map<String, dynamic> data) =>
      BorradorAgendaStruct(
        servicioRef: deserializeParam(
          data['servicioRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['servicios'],
        ),
        tipoInmueble: deserializeParam(
          data['tipoInmueble'],
          ParamType.String,
          false,
        ),
        areaCantidad: deserializeParam(
          data['areaCantidad'],
          ParamType.double,
          false,
        ),
        direccion: deserializeParam(
          data['direccion'],
          ParamType.String,
          false,
        ),
        detalles: deserializeParam(
          data['detalles'],
          ParamType.String,
          false,
        ),
        fotos: deserializeParam<String>(
          data['fotos'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'BorradorAgendaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BorradorAgendaStruct &&
        servicioRef == other.servicioRef &&
        tipoInmueble == other.tipoInmueble &&
        areaCantidad == other.areaCantidad &&
        direccion == other.direccion &&
        detalles == other.detalles &&
        listEquality.equals(fotos, other.fotos);
  }

  @override
  int get hashCode => const ListEquality().hash([
        servicioRef,
        tipoInmueble,
        areaCantidad,
        direccion,
        detalles,
        const ListEquality().hash(fotos)
      ]);
}

BorradorAgendaStruct createBorradorAgendaStruct({
  DocumentReference? servicioRef,
  String? tipoInmueble,
  double? areaCantidad,
  String? direccion,
  String? detalles,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BorradorAgendaStruct(
      servicioRef: servicioRef,
      tipoInmueble: tipoInmueble,
      areaCantidad: areaCantidad,
      direccion: direccion,
      detalles: detalles,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BorradorAgendaStruct? updateBorradorAgendaStruct(
  BorradorAgendaStruct? borradorAgenda, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    borradorAgenda
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBorradorAgendaStructData(
  Map<String, dynamic> firestoreData,
  BorradorAgendaStruct? borradorAgenda,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (borradorAgenda == null) {
    return;
  }
  if (borradorAgenda.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && borradorAgenda.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final borradorAgendaData =
      getBorradorAgendaFirestoreData(borradorAgenda, forFieldValue);
  final nestedData =
      borradorAgendaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = borradorAgenda.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBorradorAgendaFirestoreData(
  BorradorAgendaStruct? borradorAgenda, [
  bool forFieldValue = false,
]) {
  if (borradorAgenda == null) {
    return {};
  }
  final firestoreData = mapToFirestore(borradorAgenda.toMap());

  // Add any Firestore field values
  mapToFirestore(borradorAgenda.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBorradorAgendaListFirestoreData(
  List<BorradorAgendaStruct>? borradorAgendas,
) =>
    borradorAgendas
        ?.map((e) => getBorradorAgendaFirestoreData(e, true))
        .toList() ??
    [];
