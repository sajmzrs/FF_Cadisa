import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Solicitudes del cliente con una preferencia de fecha y franja.
class SolicitudesRecord extends FirestoreRecord {
  SolicitudesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  bool hasCodigo() => _codigo != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "servicioRef" field.
  DocumentReference? _servicioRef;
  DocumentReference? get servicioRef => _servicioRef;
  bool hasServicioRef() => _servicioRef != null;

  // "servicioId" field.
  String? _servicioId;
  String get servicioId => _servicioId ?? '';
  bool hasServicioId() => _servicioId != null;

  // "tipoInmueble" field.
  String? _tipoInmueble;
  String get tipoInmueble => _tipoInmueble ?? '';
  bool hasTipoInmueble() => _tipoInmueble != null;

  // "areaCantidad" field.
  double? _areaCantidad;
  double get areaCantidad => _areaCantidad ?? 0.0;
  bool hasAreaCantidad() => _areaCantidad != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "detalles" field.
  String? _detalles;
  String get detalles => _detalles ?? '';
  bool hasDetalles() => _detalles != null;

  // "fotos" field.
  List<String>? _fotos;
  List<String> get fotos => _fotos ?? const [];
  bool hasFotos() => _fotos != null;

  // "cupoId" field.
  String? _cupoId;
  String get cupoId => _cupoId ?? '';
  bool hasCupoId() => _cupoId != null;

  // "fechaPreferida" field.
  DateTime? _fechaPreferida;
  DateTime? get fechaPreferida => _fechaPreferida;
  bool hasFechaPreferida() => _fechaPreferida != null;

  // "franja" field.
  String? _franja;
  String get franja => _franja ?? '';
  bool hasFranja() => _franja != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "creadaEn" field.
  DateTime? _creadaEn;
  DateTime? get creadaEn => _creadaEn;
  bool hasCreadaEn() => _creadaEn != null;

  void _initializeFields() {
    _codigo = snapshotData['codigo'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _servicioRef = snapshotData['servicioRef'] as DocumentReference?;
    _servicioId = snapshotData['servicioId'] as String?;
    _tipoInmueble = snapshotData['tipoInmueble'] as String?;
    _areaCantidad = castToType<double>(snapshotData['areaCantidad']);
    _direccion = snapshotData['direccion'] as String?;
    _detalles = snapshotData['detalles'] as String?;
    _fotos = getDataList(snapshotData['fotos']);
    _cupoId = snapshotData['cupoId'] as String?;
    _fechaPreferida = snapshotData['fechaPreferida'] as DateTime?;
    _franja = snapshotData['franja'] as String?;
    _estado = snapshotData['estado'] as String?;
    _creadaEn = snapshotData['creadaEn'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('solicitudes');

  static Stream<SolicitudesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SolicitudesRecord.fromSnapshot(s));

  static Future<SolicitudesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SolicitudesRecord.fromSnapshot(s));

  static SolicitudesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SolicitudesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SolicitudesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SolicitudesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SolicitudesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SolicitudesRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createSolicitudesRecordData({
  String? codigo,
  DocumentReference? userRef,
  DocumentReference? servicioRef,
  String? servicioId,
  String? tipoInmueble,
  double? areaCantidad,
  String? direccion,
  String? detalles,
  String? cupoId,
  DateTime? fechaPreferida,
  String? franja,
  String? estado,
  DateTime? creadaEn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'codigo': codigo,
      'userRef': userRef,
      'servicioRef': servicioRef,
      'servicioId': servicioId,
      'tipoInmueble': tipoInmueble,
      'areaCantidad': areaCantidad,
      'direccion': direccion,
      'detalles': detalles,
      'cupoId': cupoId,
      'fechaPreferida': fechaPreferida,
      'franja': franja,
      'estado': estado,
      'creadaEn': creadaEn,
    }.withoutNulls,
  );

  return firestoreData;
}

class SolicitudesRecordDocumentEquality implements Equality<SolicitudesRecord> {
  const SolicitudesRecordDocumentEquality();

  @override
  bool equals(SolicitudesRecord? e1, SolicitudesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.codigo == e2?.codigo &&
        e1?.userRef == e2?.userRef &&
        e1?.servicioRef == e2?.servicioRef &&
        e1?.servicioId == e2?.servicioId &&
        e1?.tipoInmueble == e2?.tipoInmueble &&
        e1?.areaCantidad == e2?.areaCantidad &&
        e1?.direccion == e2?.direccion &&
        e1?.detalles == e2?.detalles &&
        listEquality.equals(e1?.fotos, e2?.fotos) &&
        e1?.cupoId == e2?.cupoId &&
        e1?.fechaPreferida == e2?.fechaPreferida &&
        e1?.franja == e2?.franja &&
        e1?.estado == e2?.estado &&
        e1?.creadaEn == e2?.creadaEn;
  }

  @override
  int hash(SolicitudesRecord? e) => const ListEquality().hash([
        e?.codigo,
        e?.userRef,
        e?.servicioRef,
        e?.servicioId,
        e?.tipoInmueble,
        e?.areaCantidad,
        e?.direccion,
        e?.detalles,
        const ListEquality().hash(e?.fotos),
        e?.cupoId,
        e?.fechaPreferida,
        e?.franja,
        e?.estado,
        e?.creadaEn
      ]);

  @override
  bool isValidKey(Object? o) => o is SolicitudesRecord;
}
