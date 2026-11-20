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

Future<ServicioDetalleDatosStruct> leerServicioParaDetalle(
  String? servicioId,
) async {
  if (servicioId == null || servicioId.isEmpty || servicioId.contains('/')) {
    return ServicioDetalleDatosStruct();
  }
  try {
    final servicio = await ServiciosRecord.getDocumentOnce(
      ServiciosRecord.collection.doc(servicioId),
    );
    if (!servicio.activo) return ServicioDetalleDatosStruct();

    final monto = NumberFormat.decimalPattern(
      'en_US',
    ).format(servicio.precioBase).replaceAll(',', ' ').replaceAll('.', ',');
    final unidad = servicio.unidad.trim();
    final entornos =
        servicio.entornos.map((e) => e.trim().toLowerCase()).toSet();
    return ServicioDetalleDatosStruct(
      titulo: servicio.titulo,
      categoria: servicio.categoria,
      descripcion: servicio.descripcion,
      precio: 'Desde ₡$monto${unidad.isEmpty ? '' : ' por $unidad'}',
      duracion: servicio.duracion,
      residencial: entornos.contains('residencial'),
      comercial: entornos.contains('comercial'),
      industrial: entornos.contains('industrial'),
      inclusiones: servicio.inclusiones,
      disponible: true,
    );
  } catch (_) {
    return ServicioDetalleDatosStruct();
  }
}
