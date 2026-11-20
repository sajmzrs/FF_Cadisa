// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';

Future<String> prepararBorradorAgenda(
  String? servicioId,
  String? tipo,
  String? area,
  String? direccion,
  String? detalles,
) async {
  if (servicioId == null || servicioId.isEmpty || servicioId.contains('/')) {
    return 'Seleccioná un servicio del catálogo.';
  }
  if (!['Residencial', 'Comercial', 'Industrial'].contains(tipo)) {
    return 'Seleccioná el tipo de inmueble.';
  }
  final cantidad = double.tryParse((area ?? '').trim().replaceAll(',', '.'));
  if (cantidad == null ||
      !cantidad.isFinite ||
      cantidad <= 0 ||
      cantidad >= 1000000000) {
    return 'Ingresá un área o cantidad válida mayor a cero.';
  }
  final ubicacion = (direccion ?? '').trim();
  if (ubicacion.isEmpty) return 'Ingresá la dirección del servicio.';

  final referencia = ServiciosRecord.collection.doc(servicioId);
  try {
    final servicio = await ServiciosRecord.getDocumentOnce(referencia);
    if (!servicio.activo) return 'El servicio ya no está disponible.';
  } catch (_) {
    return 'No se pudo verificar el servicio. Volvé al catálogo e intentá de nuevo.';
  }

  FFAppState().update(() {
    FFAppState().borradorAgenda = BorradorAgendaStruct(
      servicioRef: referencia,
      tipoInmueble: tipo,
      areaCantidad: cantidad,
      direccion: ubicacion,
      detalles: (detalles ?? '').trim(),
      fotos: [],
    );
  });
  return '';
}
