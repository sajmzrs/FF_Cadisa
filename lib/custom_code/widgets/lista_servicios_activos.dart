// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/components/service_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';

class ListaServiciosActivos extends StatefulWidget {
  const ListaServiciosActivos({
    super.key,
    this.width,
    this.height,
    required this.buscar,
    required this.categoria,
    required this.entorno,
  });

  final double? width;
  final double? height;
  final String? buscar;
  final String? categoria;
  final String? entorno;

  @override
  State<ListaServiciosActivos> createState() => _ListaServiciosActivosState();
}

class _ListaServiciosActivosState extends State<ListaServiciosActivos> {
  final _servicios = queryServiciosRecord(
    queryBuilder: (query) => query.where('activo', isEqualTo: true),
  );

  String _normalizar(String texto) => texto
      .trim()
      .toLowerCase()
      .replaceAll('á', 'a')
      .replaceAll('é', 'e')
      .replaceAll('í', 'i')
      .replaceAll('ó', 'o')
      .replaceAll('ú', 'u');

  String _precio(ServiciosRecord servicio) {
    final monto = NumberFormat.decimalPattern(
      'en_US',
    ).format(servicio.precioBase).replaceAll(',', ' ').replaceAll('.', ',');
    final unidad = servicio.unidad.trim();
    return 'Desde ₡$monto${unidad.isEmpty ? '' : ' por $unidad'}';
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: widget.width,
        height: widget.height,
        child: StreamBuilder<List<ServiciosRecord>>(
          stream: _servicios,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return const Text('No se pudo cargar el catálogo.');
            if (!snapshot.hasData)
              return const Center(child: CircularProgressIndicator());

            final buscar = _normalizar(widget.buscar ?? '');
            final categoria = _normalizar(widget.categoria ?? '');
            final entorno = _normalizar(widget.entorno ?? '');
            final visibles = snapshot.data!
                .where(
                  (servicio) =>
                      _normalizar(servicio.titulo).contains(buscar) &&
                      (categoria.isEmpty ||
                          _normalizar(servicio.categoria) == categoria) &&
                      (entorno.isEmpty ||
                          servicio.entornos.any(
                            (e) => _normalizar(e) == entorno,
                          )),
                )
                .toList()
              ..sort((a, b) => a.titulo.compareTo(b.titulo));
            if (visibles.isEmpty) {
              return Text(
                snapshot.data!.isEmpty
                    ? 'No hay servicios activos.'
                    : 'No hay servicios que coincidan con los filtros.',
              );
            }

            final tema = FlutterFlowTheme.of(context);
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final servicio in visibles)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => context.pushNamed(
                        ServicioDetalleWidget.routeName,
                        queryParameters: {'servicioId': servicio.reference.id},
                      ),
                      child: ServiceCardWidget(
                        key: ValueKey(servicio.reference.id),
                        iconName: Icon(
                          switch (_normalizar(servicio.categoria)) {
                            'limpieza profunda' => Icons.layers_rounded,
                            'desinfeccion' => Icons.sanitizer_rounded,
                            'cortinas y persianas' => Icons.curtains_rounded,
                            'pisos' => Icons.grid_view_rounded,
                            'servicios especiales' => Icons.water_drop_outlined,
                            'venta e instalacion' => Icons.handyman_outlined,
                            _ => Icons.cleaning_services_outlined,
                          },
                          color: tema.secondary,
                          size: 24,
                        ),
                        title: servicio.titulo,
                        category: servicio.categoria,
                        price: _precio(servicio),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      );
}
