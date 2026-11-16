import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Una franja por documento, publicada por CADISA.
class DisponibilidadRecord extends FirestoreRecord {
  DisponibilidadRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "inicio" field.
  DateTime? _inicio;
  DateTime? get inicio => _inicio;
  bool hasInicio() => _inicio != null;

  // "franja" field.
  String? _franja;
  String get franja => _franja ?? '';
  bool hasFranja() => _franja != null;

  // "disponible" field.
  bool? _disponible;
  bool get disponible => _disponible ?? false;
  bool hasDisponible() => _disponible != null;

  void _initializeFields() {
    _inicio = snapshotData['inicio'] as DateTime?;
    _franja = snapshotData['franja'] as String?;
    _disponible = snapshotData['disponible'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('disponibilidad');

  static Stream<DisponibilidadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DisponibilidadRecord.fromSnapshot(s));

  static Future<DisponibilidadRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DisponibilidadRecord.fromSnapshot(s));

  static DisponibilidadRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DisponibilidadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DisponibilidadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DisponibilidadRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DisponibilidadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DisponibilidadRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createDisponibilidadRecordData({
  DateTime? inicio,
  String? franja,
  bool? disponible,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'inicio': inicio,
      'franja': franja,
      'disponible': disponible,
    }.withoutNulls,
  );

  return firestoreData;
}

class DisponibilidadRecordDocumentEquality
    implements Equality<DisponibilidadRecord> {
  const DisponibilidadRecordDocumentEquality();

  @override
  bool equals(DisponibilidadRecord? e1, DisponibilidadRecord? e2) {
    return e1?.inicio == e2?.inicio &&
        e1?.franja == e2?.franja &&
        e1?.disponible == e2?.disponible;
  }

  @override
  int hash(DisponibilidadRecord? e) =>
      const ListEquality().hash([e?.inicio, e?.franja, e?.disponible]);

  @override
  bool isValidKey(Object? o) => o is DisponibilidadRecord;
}
