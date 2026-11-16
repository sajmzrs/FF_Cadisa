import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Servicios activos para el catálogo y la solicitud.
class ServiciosRecord extends FirestoreRecord {
  ServiciosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "precioBase" field.
  double? _precioBase;
  double get precioBase => _precioBase ?? 0.0;
  bool hasPrecioBase() => _precioBase != null;

  // "unidad" field.
  String? _unidad;
  String get unidad => _unidad ?? '';
  bool hasUnidad() => _unidad != null;

  // "duracion" field.
  String? _duracion;
  String get duracion => _duracion ?? '';
  bool hasDuracion() => _duracion != null;

  // "entornos" field.
  List<String>? _entornos;
  List<String> get entornos => _entornos ?? const [];
  bool hasEntornos() => _entornos != null;

  // "inclusiones" field.
  List<String>? _inclusiones;
  List<String> get inclusiones => _inclusiones ?? const [];
  bool hasInclusiones() => _inclusiones != null;

  // "activo" field.
  bool? _activo;
  bool get activo => _activo ?? false;
  bool hasActivo() => _activo != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _precioBase = castToType<double>(snapshotData['precioBase']);
    _unidad = snapshotData['unidad'] as String?;
    _duracion = snapshotData['duracion'] as String?;
    _entornos = getDataList(snapshotData['entornos']);
    _inclusiones = getDataList(snapshotData['inclusiones']);
    _activo = snapshotData['activo'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('servicios');

  static Stream<ServiciosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiciosRecord.fromSnapshot(s));

  static Future<ServiciosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiciosRecord.fromSnapshot(s));

  static ServiciosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiciosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiciosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiciosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiciosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiciosRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createServiciosRecordData({
  String? titulo,
  String? descripcion,
  String? categoria,
  double? precioBase,
  String? unidad,
  String? duracion,
  bool? activo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'descripcion': descripcion,
      'categoria': categoria,
      'precioBase': precioBase,
      'unidad': unidad,
      'duracion': duracion,
      'activo': activo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiciosRecordDocumentEquality implements Equality<ServiciosRecord> {
  const ServiciosRecordDocumentEquality();

  @override
  bool equals(ServiciosRecord? e1, ServiciosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.titulo == e2?.titulo &&
        e1?.descripcion == e2?.descripcion &&
        e1?.categoria == e2?.categoria &&
        e1?.precioBase == e2?.precioBase &&
        e1?.unidad == e2?.unidad &&
        e1?.duracion == e2?.duracion &&
        listEquality.equals(e1?.entornos, e2?.entornos) &&
        listEquality.equals(e1?.inclusiones, e2?.inclusiones) &&
        e1?.activo == e2?.activo;
  }

  @override
  int hash(ServiciosRecord? e) => const ListEquality().hash([
        e?.titulo,
        e?.descripcion,
        e?.categoria,
        e?.precioBase,
        e?.unidad,
        e?.duracion,
        const ListEquality().hash(e?.entornos),
        const ListEquality().hash(e?.inclusiones),
        e?.activo
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiciosRecord;
}
