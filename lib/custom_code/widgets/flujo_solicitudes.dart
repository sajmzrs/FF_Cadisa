// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/material.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/day_box_widget.dart';
import '/components/kpi_card_widget.dart';
import '/components/notification_item_widget.dart';
import '/components/quote_row_widget.dart';
import '/components/status_pill_widget.dart';
import '/components/step_bar2_widget.dart';
import '/components/summary_row_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlujoSolicitudes extends StatelessWidget {
  const FlujoSolicitudes({
    super.key,
    this.width,
    this.height,
    required this.modo,
  });

  final double? width;
  final double? height;
  final String modo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: switch (modo) {
        'agenda' => const _Agenda(),
        'confirmacion' => _ConfirmacionSolicitud(
            codigo: GoRouterState.of(context).uri.queryParameters['codigo'],
          ),
        _ => _Solicitudes(admin: modo == 'admin', avisos: modo == 'avisos'),
      },
    );
  }
}

// Colores fijos del prototipo que no están en el tema.
const _borde = Color(0xFFE2E4DC);
const _fondoAzul = Color(0xFFE6EEF8);
const _fondoVerde = Color(0xFFEFF4DD);

const _diasCortos = ['lun', 'mar', 'mié', 'jue', 'vie', 'sáb', 'dom'];
const _letrasDias = ['L', 'K', 'M', 'J', 'V', 'S', 'D'];
const _meses = [
  'ene',
  'feb',
  'mar',
  'abr',
  'may',
  'jun',
  'jul',
  'ago',
  'sep',
  'oct',
  'nov',
  'dic',
];
const _mesesLargos = [
  'Enero',
  'Febrero',
  'Marzo',
  'Abril',
  'Mayo',
  'Junio',
  'Julio',
  'Agosto',
  'Setiembre',
  'Octubre',
  'Noviembre',
  'Diciembre',
];

DateTime _horaCostaRica(DateTime hora) =>
    hora.toUtc().subtract(const Duration(hours: 6));

DateTime _diaCostaRica(DateTime hora) {
  final local = _horaCostaRica(hora);
  return DateTime.utc(local.year, local.month, local.day);
}

String _fechaCorta(DateTime fecha) =>
    '${_diasCortos[fecha.weekday - 1]} ${fecha.day} ${_meses[fecha.month - 1]}';

String _horario(String franja) =>
    franja == 'manana' ? '8:00 a. m. – 12:00 m. d.' : '1:00 p. m. – 5:00 p. m.';

// Formato del prototipo: ₡63 000 (miles separados por espacio).
String _colones(Object? monto) {
  final texto = NumberFormat.decimalPattern('en_US')
      .format(monto is num ? monto : 0)
      .replaceAll(',', ' ');
  return '₡$texto';
}

// Colores de la etiqueta de estado, iguales a los del prototipo.
StatusPillWidget _etiquetaEstado(String estado) {
  final (fondo, texto) = switch (estado) {
    'Cotización lista' => (_fondoAzul, const Color(0xFF2D6BB4)),
    'Confirmada' || 'En proceso' => (_fondoVerde, const Color(0xFF6B8510)),
    'Finalizada' => (const Color(0xFFECEDE8), const Color(0xFF6B6E6E)),
    'Cancelada' || 'Rechazada' => (
        const Color(0xFFFBEAEA),
        const Color(0xFFC0392B)
      ),
    _ => (const Color(0xFFF6F1D5), const Color(0xFF8F7F0E)),
  };
  return StatusPillWidget(bgColor: fondo, label: estado, textColor: texto);
}

Widget _tarjeta(BuildContext context, Widget child, {VoidCallback? onTap}) {
  return Material(
    color: FlutterFlowTheme.of(context).secondaryBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: _borde),
    ),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      child: Padding(padding: const EdgeInsets.all(14), child: child),
    ),
  );
}

Widget _titulo(BuildContext context, String texto) => Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 8),
      child: Text(
        texto,
        style: FlutterFlowTheme.of(context)
            .bodyMedium
            .override(fontWeight: FontWeight.bold, letterSpacing: 0),
      ),
    );

Widget _textoChico(BuildContext context, String texto, {Color? color}) => Text(
      texto,
      style: FlutterFlowTheme.of(context).bodySmall.override(
            color: color ?? FlutterFlowTheme.of(context).secondaryText,
            fontSize: 12,
            letterSpacing: 0,
          ),
    );

Widget _botonPrincipal(
  BuildContext context,
  String texto,
  VoidCallback? onPressed, {
  IconData? icono,
}) {
  final tema = FlutterFlowTheme.of(context);
  return SizedBox(
    height: 52,
    width: double.infinity,
    child: ElevatedButton.icon(
      onPressed: onPressed,
      icon: icono == null ? const SizedBox.shrink() : Icon(icono, size: 18),
      label: Text(texto),
      style: ElevatedButton.styleFrom(
        backgroundColor: tema.primary,
        foregroundColor: Colors.white,
        disabledBackgroundColor: tema.primary.withOpacity(0.4),
        disabledForegroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: tema.bodyMedium.override(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          letterSpacing: 0,
        ),
      ),
    ),
  );
}

Widget _mensajeError(BuildContext context, String texto) => Padding(
      padding: const EdgeInsets.only(top: 8),
      child: _textoChico(context, texto,
          color: FlutterFlowTheme.of(context).error),
    );

// Fila del detalle: ícono, etiqueta gris y valor, como en el prototipo.
Widget _filaDato(
    BuildContext context, IconData icono, String etiqueta, String valor) {
  final tema = FlutterFlowTheme.of(context);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icono, size: 16, color: tema.primary),
        const SizedBox(width: 8),
        SizedBox(width: 72, child: _textoChico(context, etiqueta)),
        Expanded(
          child: Text(
            valor,
            style: tema.bodySmall.override(fontSize: 12, letterSpacing: 0),
          ),
        ),
      ],
    ),
  );
}

// Diálogo de confirmación con los colores y la letra de la app.
AlertDialog _dialogo(
  BuildContext context, {
  required String titulo,
  required Widget contenido,
  required String accion,
  required VoidCallback alConfirmar,
  bool peligro = false,
}) {
  final tema = FlutterFlowTheme.of(context);
  return AlertDialog(
    backgroundColor: tema.secondaryBackground,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    title: Text(
      titulo,
      style: tema.titleMedium.override(
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
    ),
    content: contenido,
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          'Volver',
          style: tema.bodyMedium.override(
            color: tema.secondaryText,
            letterSpacing: 0,
          ),
        ),
      ),
      FilledButton(
        onPressed: alConfirmar,
        style: FilledButton.styleFrom(
          backgroundColor: peligro ? tema.error : tema.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          accion,
          style: tema.bodyMedium.override(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
          ),
        ),
      ),
    ],
  );
}

// Pantalla final del envío: círculo verde, código y acceso a Mis solicitudes.
class _SolicitudEnviada extends StatelessWidget {
  const _SolicitudEnviada({required this.codigo, this.conInicio = false});

  final String codigo;
  final bool conInicio;

  @override
  Widget build(BuildContext context) {
    final tema = FlutterFlowTheme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Column(
        children: [
          const Spacer(),
          Container(
            width: 96,
            height: 96,
            decoration: const BoxDecoration(
              color: _fondoVerde,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check_rounded, size: 52, color: tema.secondary),
          ),
          const SizedBox(height: 20),
          Text(
            '¡Solicitud enviada!',
            style: tema.titleMedium.override(
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tu número de solicitud es $codigo. Te enviaremos la cotización '
            'en un plazo máximo de 24 horas hábiles.',
            textAlign: TextAlign.center,
            style: tema.bodySmall.override(
              color: tema.secondaryText,
              letterSpacing: 0,
            ),
          ),
          const Spacer(),
          _botonPrincipal(
            context,
            'Ver mis solicitudes',
            () => context.goNamed('Solicitudes'),
          ),
          if (conInicio)
            TextButton(
              onPressed: () => context.goNamed('Inicio'),
              child: Text(
                'Volver al inicio',
                style: tema.bodySmall.override(
                  color: tema.primary,
                  letterSpacing: 0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ConfirmacionSolicitud extends StatefulWidget {
  const _ConfirmacionSolicitud({required this.codigo});

  final String? codigo;

  @override
  State<_ConfirmacionSolicitud> createState() => _ConfirmacionSolicitudState();
}

class _ConfirmacionSolicitudState extends State<_ConfirmacionSolicitud> {
  Future<DocumentSnapshot<Map<String, dynamic>>>? _guardada;

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  @override
  void didUpdateWidget(covariant _ConfirmacionSolicitud oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.codigo != oldWidget.codigo) _cargar();
  }

  void _cargar() {
    final codigo = widget.codigo ?? '';
    _guardada = RegExp(r'^SOL-[A-Za-z0-9]{20}$').hasMatch(codigo)
        ? FirebaseFirestore.instance
            .collection('solicitudes')
            .doc(codigo.substring(4))
            .get()
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: _guardada,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError ||
            snapshot.data?.data()?['codigo'] != widget.codigo ||
            snapshot.data?.exists != true) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Consultá Mis solicitudes para verificar el envío.',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          );
        }
        return _SolicitudEnviada(codigo: widget.codigo!);
      },
    );
  }
}

class _Cupo {
  const _Cupo(this.id, this.inicio, this.franja);

  final String id;
  final DateTime inicio;
  final String franja;
}

class _Agenda extends StatefulWidget {
  const _Agenda();

  @override
  State<_Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<_Agenda> {
  final _borrador = FFAppState().borradorAgenda;
  final _db = FirebaseFirestore.instance;
  final _hoy = _diaCostaRica(DateTime.now());
  late Stream<QuerySnapshot<Map<String, dynamic>>> _cupos;
  Future<DocumentSnapshot<Object?>>? _servicio;
  DocumentReference<Map<String, dynamic>>? _solicitud;
  DateTime? _dia;
  String? _cupoId;
  bool _enviando = false;
  String? _error;
  String? _codigo;

  bool get _borradorValido =>
      _borrador.servicioRef?.parent.path == 'servicios' &&
      const [
        'Residencial',
        'Comercial',
        'Industrial',
      ].contains(_borrador.tipoInmueble) &&
      _borrador.areaCantidad.isFinite &&
      _borrador.areaCantidad > 0 &&
      _borrador.direccion.trim().isNotEmpty &&
      _borrador.fotos.length <= 5;

  @override
  void initState() {
    super.initState();
    _cargarCupos();
    if (_borradorValido) {
      _servicio = _borrador.servicioRef!.get();
    }
  }

  void _cargarCupos() {
    final ahora = DateTime.now().toUtc();
    final fin = _hoy.add(const Duration(days: 14, hours: 6));
    _cupos = _db
        .collection('disponibilidad')
        .where('inicio', isGreaterThan: Timestamp.fromDate(ahora))
        .where('inicio', isLessThan: Timestamp.fromDate(fin))
        .orderBy('inicio')
        .snapshots();
  }

  List<_Cupo> _leerCupos(QuerySnapshot<Map<String, dynamic>>? snapshot) {
    final ahora = DateTime.now();
    final cupos = <_Cupo>[];
    for (final doc
        in snapshot?.docs ?? <QueryDocumentSnapshot<Map<String, dynamic>>>[]) {
      final datos = doc.data();
      final inicio = datos['inicio'];
      final franja = datos['franja'];
      if (datos['disponible'] != true ||
          inicio is! Timestamp ||
          (franja != 'manana' && franja != 'tarde')) {
        continue;
      }
      final fecha = inicio.toDate();
      if (fecha.isAfter(ahora) &&
          _diaCostaRica(fecha).weekday != DateTime.sunday) {
        cupos.add(_Cupo(doc.id, fecha, franja as String));
      }
    }
    return cupos;
  }

  Future<void> _enviar(_Cupo cupo) async {
    final usuario = currentUserReference;
    if (_enviando || _codigo != null || usuario == null || !_borradorValido) {
      return;
    }
    final servicio = _borrador.servicioRef!;
    final solicitud = _solicitud ??= _db.collection('solicitudes').doc();
    final codigo = 'SOL-${solicitud.id}';
    setState(() {
      _enviando = true;
      _error = null;
    });
    try {
      try {
        await solicitud.set({
          'codigo': codigo,
          'userRef': usuario,
          'servicioRef': servicio,
          'servicioId': servicio.id,
          'tipoInmueble': _borrador.tipoInmueble,
          'areaCantidad': _borrador.areaCantidad,
          'direccion': _borrador.direccion.trim(),
          'detalles': _borrador.detalles.trim(),
          'fotos': List<String>.of(_borrador.fotos),
          'cupoId': cupo.id,
          'fechaPreferida': Timestamp.fromDate(cupo.inicio),
          'franja': cupo.franja,
          'estado': 'En revisión',
          'creadaEn': FieldValue.serverTimestamp(),
        });
      } on FirebaseException {
        // Si se perdió la respuesta de una escritura exitosa, recuperar el
        // mismo documento evita crear otra solicitud durante el reintento.
        final guardada = await solicitud.get(
          const GetOptions(source: Source.server),
        );
        if (!guardada.exists) rethrow;
      }
      if (identical(FFAppState().borradorAgenda, _borrador)) {
        FFAppState().update(
          () => FFAppState().borradorAgenda = BorradorAgendaStruct(),
        );
      }
      if (mounted) {
        setState(() => _codigo = codigo);
        context.goNamed(
          'SolicitudEnviada',
          queryParameters: {'codigo': codigo},
        );
      }
    } on FirebaseException {
      if (mounted) {
        setState(
          () => _error =
              'No se pudo enviar. Verificá tu conexión y elegí un cupo disponible.',
        );
      }
    } finally {
      if (mounted) setState(() => _enviando = false);
    }
  }

  Widget _pasos(BuildContext context) {
    final tema = FlutterFlowTheme.of(context);
    return Row(
      children: [
        Expanded(
          child: StepBar2Widget(
            color: tema.secondary,
            label: 'Servicio',
            isBold: false,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: StepBar2Widget(
            color: tema.secondary,
            label: 'Fecha',
            isBold: true,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: StepBar2Widget(
            color: _borde,
            label: 'Enviar',
            isBold: false,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final codigo = _codigo;
    if (codigo != null) {
      return _SolicitudEnviada(codigo: codigo, conInicio: true);
    }
    final tema = FlutterFlowTheme.of(context);
    if (!_borradorValido) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Volvé al formulario y completá los datos de la solicitud.',
          style: tema.bodyMedium,
        ),
      );
    }
    return FutureBuilder<DocumentSnapshot<Object?>>(
      future: _servicio,
      builder: (context, servicio) {
        if (servicio.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final datos = servicio.data?.data();
        if (servicio.hasError || datos is! Map || datos['activo'] != true) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'No se pudo cargar el servicio. Volvé al catálogo para intentar de nuevo.',
              style: tema.bodyMedium,
            ),
          );
        }
        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: _cupos,
          builder: (context, datosCupos) {
            if (datosCupos.hasError) {
              return Center(
                child: TextButton(
                  onPressed: () => setState(_cargarCupos),
                  child: const Text('Reintentar cargar fechas'),
                ),
              );
            }
            if (!datosCupos.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final cupos = _leerCupos(datosCupos.data);
            final porDia = <DateTime, List<_Cupo>>{};
            for (final cupo in cupos) {
              (porDia[_diaCostaRica(cupo.inicio)] ??= []).add(cupo);
            }
            final franjas = porDia[_dia] ?? const <_Cupo>[];
            _Cupo? seleccionado;
            for (final cupo in franjas) {
              if (cupo.id == _cupoId) seleccionado = cupo;
            }
            final elegido = seleccionado;
            final mes = '${_mesesLargos[_hoy.month - 1]} ${_hoy.year}';
            return ListView(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
              children: [
                _pasos(context),
                _titulo(context, mes),
                for (var semana = 0; semana < 2; semana++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var i = 0; i < 7; i++)
                          _botonDia(
                            _hoy.add(Duration(days: semana * 7 + i)),
                            porDia,
                          ),
                      ],
                    ),
                  ),
                _textoChico(
                  context,
                  cupos.isEmpty
                      ? 'No hay fechas disponibles en las próximas dos semanas.'
                      : 'Los días tachados no tienen cuadrillas disponibles.',
                ),
                _titulo(context, 'Franja horaria'),
                if (franjas.isEmpty)
                  _textoChico(context, 'Seleccioná una fecha disponible.'),
                for (final cupo in franjas)
                  _opcionFranja(context, cupo, elegido?.id == cupo.id),
                _titulo(context, 'Resumen'),
                _tarjeta(
                  context,
                  Column(
                    children: [
                      SummaryRowWidget(
                        label: 'Servicio',
                        value: datos['titulo']?.toString() ?? 'Servicio',
                      ),
                      const Divider(height: 16, color: _borde),
                      SummaryRowWidget(
                        label: 'Inmueble',
                        value: '${_borrador.tipoInmueble} · '
                            '${_borrador.areaCantidad.toStringAsFixed(0)} m²',
                      ),
                      const Divider(height: 16, color: _borde),
                      SummaryRowWidget(
                        label: 'Dirección',
                        value: _borrador.direccion,
                      ),
                      const Divider(height: 16, color: _borde),
                      SummaryRowWidget(
                        label: 'Fecha',
                        value: elegido == null
                            ? 'Por elegir'
                            : '${_fechaCorta(_horaCostaRica(elegido.inicio))} · '
                                '${_horario(elegido.franja)}',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                _textoChico(
                  context,
                  'La fecha es una preferencia. CADISA confirmará la visita después de cotizar.',
                ),
                if (_error != null) _mensajeError(context, _error!),
                const SizedBox(height: 16),
                _botonPrincipal(
                  context,
                  _enviando ? 'Enviando…' : 'Enviar solicitud',
                  elegido == null || _enviando ? null : () => _enviar(elegido),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _botonDia(DateTime dia, Map<DateTime, List<_Cupo>> cupos) {
    final disponible = cupos.containsKey(dia);
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: disponible && !_enviando
          ? () => setState(() {
                _dia = dia;
                _cupoId = null;
                _error = null;
              })
          : null,
      child: DayBoxWidget(
        selected: _dia == dia && disponible,
        weekday: _letrasDias[dia.weekday - 1],
        day: '${dia.day}',
        disabled: !disponible,
      ),
    );
  }

  Widget _opcionFranja(BuildContext context, _Cupo cupo, bool elegida) {
    final tema = FlutterFlowTheme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: elegida ? _fondoAzul : tema.secondaryBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: elegida ? tema.primary : _borde),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: _enviando
              ? null
              : () => setState(() {
                    _cupoId = cupo.id;
                    _error = null;
                  }),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Icon(
                  elegida
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: tema.primary,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(_horario(cupo.franja), style: tema.bodyMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Solicitudes extends StatefulWidget {
  const _Solicitudes({required this.admin, required this.avisos});

  final bool admin;
  final bool avisos;

  @override
  State<_Solicitudes> createState() => _SolicitudesState();
}

class _SolicitudesState extends State<_Solicitudes> {
  static const _cerradas = {'Finalizada', 'Cancelada', 'Rechazada'};
  final _titulos = <String, Future<String>>{};
  final _clientes = <String, Future<String>>{};
  bool _historial = false;
  String _filtro = 'Todas';
  Stream<QuerySnapshot<Map<String, dynamic>>>? _solicitudes;

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  void _cargar() {
    final usuario = currentUserReference;
    if (usuario != null) {
      final coleccion = FirebaseFirestore.instance.collection('solicitudes');
      _solicitudes = widget.admin
          ? coleccion.snapshots()
          : coleccion.where('userRef', isEqualTo: usuario).snapshots();
    }
  }

  Future<String> _tituloServicio(Map<String, dynamic> datos) {
    final ref = datos['servicioRef'];
    if (ref is! DocumentReference) return Future.value('Servicio');
    return _titulos.putIfAbsent(ref.path, () async {
      try {
        final servicio = (await ref.get()).data();
        if (servicio is Map && servicio['titulo'] is String) {
          return servicio['titulo'] as String;
        }
      } on FirebaseException {
        // Un servicio retirado puede seguir apareciendo en el historial.
      }
      return 'Servicio';
    });
  }

  // Solo el panel de administración muestra el nombre del cliente.
  Future<String> _nombreCliente(Map<String, dynamic> datos) {
    final ref = datos['userRef'];
    if (!widget.admin || ref is! DocumentReference) return Future.value('');
    return _clientes.putIfAbsent(ref.path, () async {
      try {
        final cliente = (await ref.get()).data();
        if (cliente is Map && cliente['display_name'] is String) {
          final nombre = (cliente['display_name'] as String).trim();
          if (nombre.isNotEmpty) return nombre;
        }
      } on FirebaseException {
        // Si no se puede leer el perfil se muestra el texto genérico.
      }
      return 'Cliente';
    });
  }

  String _fechaSolicitud(Map<String, dynamic> datos) {
    final fecha = datos['fechaPreferida'];
    return fecha is Timestamp
        ? _fechaCorta(_horaCostaRica(fecha.toDate()))
        : 'Sin fecha';
  }

  int _creada(Map<String, dynamic> datos) {
    final fecha = datos['creadaEn'];
    return fecha is Timestamp ? fecha.millisecondsSinceEpoch : 0;
  }

  Future<void> _abrirDetalle(
    QueryDocumentSnapshot<Map<String, dynamic>> solicitud,
    String titulo,
  ) async {
    final estado = solicitud.data()['estado']?.toString() ?? 'En revisión';
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => widget.admin && estado == 'En revisión'
          ? _FormularioCotizacion(solicitud: solicitud, titulo: titulo)
          : _DetalleSolicitud(
              solicitud: solicitud,
              titulo: titulo,
              admin: widget.admin,
            ),
    );
  }

  bool _mostrar(Map<String, dynamic> datos) {
    if (widget.avisos) return datos['cotizadaEn'] is Timestamp;
    if (widget.admin) return _filtro == 'Todas' || datos['estado'] == _filtro;
    return _cerradas.contains(datos['estado']) == _historial;
  }

  int _orden(Map<String, dynamic> datos) {
    final enviada = datos['cotizadaEn'];
    return widget.avisos && enviada is Timestamp
        ? enviada.millisecondsSinceEpoch
        : _creada(datos);
  }

  Widget _indicadores(List<QueryDocumentSnapshot<Map<String, dynamic>>> items) {
    final tema = FlutterFlowTheme.of(context);
    final hoy = _diaCostaRica(DateTime.now());
    final lunes = hoy.subtract(Duration(days: hoy.weekday - 1));
    final fin = lunes.add(const Duration(days: 7));
    var porCotizar = 0;
    var citas = 0;
    var suma = 0.0;
    var calificadas = 0;
    for (final item in items) {
      final datos = item.data();
      if (datos['estado'] == 'En revisión') porCotizar++;
      final fecha = datos['fechaPreferida'];
      if (datos['estado'] == 'Confirmada' && fecha is Timestamp) {
        final dia = _diaCostaRica(fecha.toDate());
        if (!dia.isBefore(lunes) && dia.isBefore(fin)) citas++;
      }
      final estrellas = datos['estrellas'];
      if (estrellas is num && estrellas >= 1 && estrellas <= 5) {
        suma += estrellas;
        calificadas++;
      }
    }
    final promedio =
        calificadas == 0 ? '–' : (suma / calificadas).toStringAsFixed(1);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
      child: Row(
        children: [
          Expanded(
            child: KpiCardWidget(
              accentColor: tema.secondary,
              value: '$porCotizar',
              label: 'Por cotizar',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: KpiCardWidget(
              accentColor: tema.primary,
              value: '$citas',
              label: 'Citas esta semana',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: KpiCardWidget(
              accentColor: tema.secondary,
              value: promedio,
              label: 'Calificación',
            ),
          ),
        ],
      ),
    );
  }

  Widget _filtros() {
    final tema = FlutterFlowTheme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
      child: Row(
        children: [
          for (final filtro in const {
            'Todas': 'Todas',
            'En revisión': 'Por cotizar',
            'Cotización lista': 'Cotizadas',
            'Confirmada': 'Confirmadas',
          }.entries)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Material(
                color: _filtro == filtro.key
                    ? _fondoVerde
                    : tema.secondaryBackground,
                shape: StadiumBorder(
                  side: BorderSide(
                    color: _filtro == filtro.key ? tema.secondary : _borde,
                  ),
                ),
                child: InkWell(
                  customBorder: const StadiumBorder(),
                  onTap: () => setState(() => _filtro = filtro.key),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    child: Text(
                      filtro.value,
                      style: tema.bodySmall.override(letterSpacing: 0),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _pestanas() {
    final tema = FlutterFlowTheme.of(context);
    Widget pestana(String texto, bool historial) {
      final activa = _historial == historial;
      return Expanded(
        child: InkWell(
          onTap: () => setState(() => _historial = historial),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: activa ? tema.primary : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              texto,
              style: tema.bodySmall.override(
                color: activa ? tema.primary : tema.secondaryText,
                fontWeight: activa ? FontWeight.bold : FontWeight.normal,
                letterSpacing: 0,
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [pestana('Activas', false), pestana('Historial', true)],
      ),
    );
  }

  Widget _tarjetaSolicitud(
    QueryDocumentSnapshot<Map<String, dynamic>> solicitud,
    String servicio,
    String cliente,
  ) {
    final tema = FlutterFlowTheme.of(context);
    final datos = solicitud.data();
    final estado = datos['estado']?.toString() ?? 'En revisión';
    return _tarjeta(
      context,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _textoChico(
                  context,
                  datos['codigo']?.toString() ?? '',
                ),
              ),
              _etiquetaEstado(estado),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            widget.admin ? cliente : servicio,
            style: tema.bodyMedium.override(
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
          if (widget.admin) _textoChico(context, servicio),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_today_outlined,
                  size: 14, color: tema.secondaryText),
              const SizedBox(width: 4),
              _textoChico(context, _fechaSolicitud(datos)),
              const SizedBox(width: 12),
              Icon(Icons.place_outlined, size: 14, color: tema.secondaryText),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  datos['direccion']?.toString() ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: tema.bodySmall.override(
                    color: tema.secondaryText,
                    fontSize: 12,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      onTap: () => _abrirDetalle(solicitud, servicio),
    );
  }

  Widget _aviso(
    QueryDocumentSnapshot<Map<String, dynamic>> solicitud,
    String servicio,
  ) {
    final tema = FlutterFlowTheme.of(context);
    final datos = solicitud.data();
    final estado = datos['estado']?.toString() ?? '';
    final codigo = datos['codigo']?.toString() ?? '';
    final (titulo, cuerpo, icono) = switch (estado) {
      'Confirmada' => (
          'Cita confirmada',
          '$codigo · ${_fechaSolicitud(datos)}. Te avisaremos la cuadrilla asignada.',
          Icons.event_available_outlined,
        ),
      'Cancelada' => (
          'Cotización rechazada',
          '$codigo · $servicio. Podés crear una nueva solicitud cuando quieras.',
          Icons.event_busy_outlined,
        ),
      _ => (
          'Tu cotización está lista',
          '$codigo · $servicio por ${_colones(datos['total'])}. Revisala y confirmá.',
          Icons.request_quote_outlined,
        ),
    };
    final enviada = datos['cotizadaEn'];
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => _abrirDetalle(solicitud, servicio),
      child: NotificationItemWidget(
        unread: estado == 'Cotización lista',
        iconColor: _fondoAzul,
        icon: Icon(icono, color: tema.primary, size: 20),
        title: titulo,
        body: cuerpo,
        time: enviada is Timestamp ? _hace(enviada.toDate()) : '',
      ),
    );
  }

  String _hace(DateTime fecha) {
    final minutos = DateTime.now().difference(fecha).inMinutes;
    if (minutos < 1) return 'Ahora';
    if (minutos < 60) return 'Hace $minutos min';
    if (minutos < 60 * 24) return 'Hace ${minutos ~/ 60} h';
    return _fechaCorta(_horaCostaRica(fecha));
  }

  @override
  Widget build(BuildContext context) {
    final tema = FlutterFlowTheme.of(context);
    if (_solicitudes == null) {
      return Center(
        child: Text(
          'Iniciá sesión para ver tus solicitudes.',
          style: tema.bodyMedium,
        ),
      );
    }
    return Column(
      children: [
        if (!widget.admin && !widget.avisos) _pestanas(),
        Expanded(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _solicitudes,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: TextButton(
                    onPressed: () => setState(_cargar),
                    child: const Text('Reintentar'),
                  ),
                );
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final todos = snapshot.data!.docs;
              final items = todos.where((doc) => _mostrar(doc.data())).toList()
                ..sort(
                  (a, b) => _orden(b.data()).compareTo(_orden(a.data())),
                );
              final vacio = widget.avisos
                  ? 'Todavía no hay avisos de cotizaciones.'
                  : widget.admin
                      ? 'No hay solicitudes para este filtro.'
                      : _historial
                          ? 'Todavía no hay solicitudes en el historial.'
                          : 'No tenés solicitudes activas.';
              return Column(
                children: [
                  if (widget.admin) _indicadores(todos),
                  if (widget.admin) _filtros(),
                  if (items.isEmpty)
                    Expanded(
                      child: Center(
                        child: _textoChico(context, vacio),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final solicitud = items[index];
                          final datos = solicitud.data();
                          return FutureBuilder<List<String>>(
                            future: Future.wait([
                              _tituloServicio(datos),
                              _nombreCliente(datos),
                            ]),
                            builder: (context, nombres) {
                              final servicio =
                                  nombres.data?.first ?? 'Servicio';
                              final cliente = nombres.data?.last ?? '';
                              return widget.avisos
                                  ? _aviso(solicitud, servicio)
                                  : _tarjetaSolicitud(
                                      solicitud,
                                      servicio,
                                      cliente,
                                    );
                            },
                          );
                        },
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

// Detalle de una solicitud: avance, datos, cotización y respuesta del cliente.
class _DetalleSolicitud extends StatelessWidget {
  const _DetalleSolicitud({
    required this.solicitud,
    required this.titulo,
    required this.admin,
  });

  final QueryDocumentSnapshot<Map<String, dynamic>> solicitud;
  final String titulo;
  final bool admin;

  static const _pasos = ['Enviada', 'Cotizada', 'Confirmada', 'Finalizada'];

  int _paso(String estado) => switch (estado) {
        'Cotización lista' => 1,
        'Confirmada' || 'En proceso' => 2,
        'Finalizada' => 3,
        _ => 0,
      };

  Widget _avance(BuildContext context, String estado) {
    final tema = FlutterFlowTheme.of(context);
    final actual = _paso(estado);
    final cerrada = estado == 'Cancelada' || estado == 'Rechazada';
    return Column(
      children: [
        Row(
          children: [
            for (var i = 0; i < _pasos.length; i++) ...[
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: i <= actual && !cerrada ? tema.secondary : _borde,
                  shape: BoxShape.circle,
                ),
                child: i <= actual && !cerrada
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : null,
              ),
              if (i < _pasos.length - 1)
                Expanded(
                  child: Container(
                    height: 2,
                    color: i < actual && !cerrada ? tema.secondary : _borde,
                  ),
                ),
            ],
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final paso in _pasos) _textoChico(context, paso),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final tema = FlutterFlowTheme.of(context);
    final datos = solicitud.data();
    final estado = datos['estado']?.toString() ?? 'En revisión';
    final franja = datos['franja'];
    final area = datos['areaCantidad'];
    final nota = datos['notaAdmin']?.toString() ?? '';
    final vence = datos['venceEn'];
    final fecha = datos['fechaPreferida'];
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            datos['codigo']?.toString() ?? '',
            style: tema.bodyMedium.override(
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Text(
                  titulo,
                  style: tema.titleMedium.override(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                  ),
                ),
              ),
              _etiquetaEstado(estado),
            ],
          ),
          const SizedBox(height: 14),
          _avance(context, estado),
          const SizedBox(height: 14),
          _tarjeta(
            context,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _filaDato(
                  context,
                  Icons.home_work_outlined,
                  'Inmueble',
                  '${datos['tipoInmueble'] ?? ''} · ${area is num ? area.toStringAsFixed(0) : ''} m²',
                ),
                _filaDato(
                  context,
                  Icons.place_outlined,
                  'Dirección',
                  datos['direccion']?.toString() ?? '',
                ),
                _filaDato(
                  context,
                  Icons.calendar_today_outlined,
                  'Fecha',
                  fecha is Timestamp && franja is String
                      ? '${_fechaCorta(_horaCostaRica(fecha.toDate()))} · ${_horario(franja)}'
                      : 'Sin fecha',
                ),
              ],
            ),
          ),
          if (datos['cotizadaEn'] is Timestamp) ...[
            _titulo(context, 'Cotización'),
            _tarjeta(
              context,
              Column(
                children: [
                  QuoteRowWidget(
                    label: titulo,
                    amount: _colones(datos['montoSinIva']),
                    isTotal: false,
                  ),
                  QuoteRowWidget(
                    label: 'IVA 13%',
                    amount: _colones(datos['iva']),
                    isTotal: false,
                  ),
                  const Divider(height: 16, color: _borde),
                  QuoteRowWidget(
                    label: 'Total',
                    amount: _colones(datos['total']),
                    isTotal: true,
                  ),
                  if (nota.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _textoChico(context, nota),
                    ),
                  ],
                  if (vence is Timestamp) ...[
                    const SizedBox(height: 8),
                    _textoChico(
                      context,
                      'Cotización válida hasta el ${_fechaCorta(_horaCostaRica(vence.toDate()))}.',
                    ),
                  ],
                ],
              ),
            ),
          ],
          if (!admin && estado == 'Cotización lista')
            _RespuestaCotizacion(solicitud: solicitud),
        ],
      ),
    );
  }
}

class _FormularioCotizacion extends StatefulWidget {
  const _FormularioCotizacion({required this.solicitud, required this.titulo});

  final QueryDocumentSnapshot<Map<String, dynamic>> solicitud;
  final String titulo;

  @override
  State<_FormularioCotizacion> createState() => _FormularioCotizacionState();
}

class _FormularioCotizacionState extends State<_FormularioCotizacion> {
  final _monto = TextEditingController();
  final _nota = TextEditingController();
  bool _guardando = false;
  String? _error;

  int? get _subtotal {
    final texto = _monto.text.trim();
    if (!RegExp(r'^\d+$').hasMatch(texto)) return null;
    final monto = int.tryParse(texto);
    return monto != null && monto > 0 && monto <= 100000000 ? monto : null;
  }

  @override
  void dispose() {
    _monto.dispose();
    _nota.dispose();
    super.dispose();
  }

  Future<void> _cotizar(int monto) async {
    if (_guardando) return;
    final iva = (monto * 13 + 50) ~/ 100;
    setState(() {
      _guardando = true;
      _error = null;
    });
    try {
      await widget.solicitud.reference.update({
        'estado': 'Cotización lista',
        'montoSinIva': monto,
        'iva': iva,
        'total': monto + iva,
        'notaAdmin': _nota.text.trim(),
        'cotizadaEn': FieldValue.serverTimestamp(),
        'venceEn': Timestamp.fromDate(
          DateTime.now().add(const Duration(days: 7)),
        ),
      });
      if (mounted) Navigator.pop(context);
    } on FirebaseException {
      if (mounted) {
        setState(
          () => _error =
              'No se pudo enviar la cotización. Revisá la conexión y el estado de la solicitud.',
        );
      }
    } finally {
      if (mounted) setState(() => _guardando = false);
    }
  }

  InputDecoration _campo(BuildContext context, String ayuda,
      {String? prefijo}) {
    final tema = FlutterFlowTheme.of(context);
    final borde = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: _borde),
    );
    return InputDecoration(
      hintText: ayuda,
      prefixIcon: prefijo == null
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 14, right: 6),
              child: Text(prefijo, style: tema.bodyMedium),
            ),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      filled: true,
      fillColor: tema.secondaryBackground,
      enabledBorder: borde,
      disabledBorder: borde,
      focusedBorder: borde.copyWith(
        borderSide: BorderSide(color: tema.primary),
      ),
      counterText: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final tema = FlutterFlowTheme.of(context);
    final datos = widget.solicitud.data();
    final fecha = datos['fechaPreferida'];
    final franja = datos['franja'];
    final detalles = datos['detalles']?.toString() ?? '';
    final monto = _subtotal;
    final iva = monto == null ? 0 : (monto * 13 + 50) ~/ 100;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        24 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Cotizar ${datos['codigo'] ?? ''}',
            style: tema.titleMedium.override(
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 12),
          _tarjeta(
            context,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.titulo,
                        style: tema.bodyMedium.override(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    _etiquetaEstado('En revisión'),
                  ],
                ),
                const SizedBox(height: 4),
                _textoChico(
                  context,
                  '${datos['tipoInmueble']} · ${datos['areaCantidad']} m² · ${datos['direccion']}',
                ),
                if (fecha is Timestamp && franja is String)
                  _textoChico(
                    context,
                    '${_fechaCorta(_horaCostaRica(fecha.toDate()))} · ${_horario(franja)}',
                  ),
                if (detalles.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    '"$detalles"',
                    style: tema.bodySmall.override(
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ],
            ),
          ),
          _titulo(context, 'Monto del servicio (sin IVA)'),
          TextField(
            controller: _monto,
            enabled: !_guardando,
            keyboardType: TextInputType.number,
            style: tema.bodyMedium,
            decoration: _campo(context, '120000', prefijo: '₡'),
            onChanged: (_) => setState(() => _error = null),
          ),
          const SizedBox(height: 6),
          Text(
            'IVA 13%: ${_colones(iva)} · Total: ${_colones((monto ?? 0) + iva)}',
            style: tema.bodySmall.override(
              color: tema.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
          _titulo(context, 'Nota para el cliente'),
          TextField(
            controller: _nota,
            enabled: !_guardando,
            style: tema.bodyMedium,
            maxLines: 3,
            maxLength: 1200,
            decoration: _campo(context, 'Ej: incluye desengrase de ductos'),
          ),
          const SizedBox(height: 6),
          _textoChico(context, 'La cotización tiene vigencia de 7 días.'),
          if (_error != null) _mensajeError(context, _error!),
          const SizedBox(height: 16),
          _botonPrincipal(
            context,
            _guardando ? 'Enviando…' : 'Enviar cotización',
            monto == null || _guardando ? null : () => _cotizar(monto),
            icono: Icons.send_rounded,
          ),
        ],
      ),
    );
  }
}

class _RespuestaCotizacion extends StatefulWidget {
  const _RespuestaCotizacion({required this.solicitud});

  final QueryDocumentSnapshot<Map<String, dynamic>> solicitud;

  @override
  State<_RespuestaCotizacion> createState() => _RespuestaCotizacionState();
}

class _RespuestaCotizacionState extends State<_RespuestaCotizacion> {
  bool _guardando = false;
  String? _error;

  Future<void> _responder(bool acepta, {String? motivo}) async {
    if (_guardando) return;
    setState(() {
      _guardando = true;
      _error = null;
    });
    try {
      await widget.solicitud.reference.update({
        'estado': acepta ? 'Confirmada' : 'Cancelada',
        'respondidaEn': FieldValue.serverTimestamp(),
        if (!acepta && motivo != null && motivo.isNotEmpty)
          'motivoRechazo': motivo,
      });
      if (mounted) Navigator.pop(context);
    } on FirebaseException {
      if (mounted) {
        setState(
          () => _error =
              'No se pudo guardar la respuesta. Cerrá el detalle y revisá el estado o la vigencia.',
        );
      }
    } finally {
      if (mounted) setState(() => _guardando = false);
    }
  }

  Future<void> _aceptar() async {
    final acepta = await showDialog<bool>(
      context: context,
      builder: (context) => _dialogo(
        context,
        titulo: '¿Aceptar la cotización?',
        contenido: Text(
          'CADISA confirmará la visita por ${_colones(widget.solicitud.data()['total'])}.',
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
        accion: 'Aceptar',
        alConfirmar: () => Navigator.pop(context, true),
      ),
    );
    if (mounted && acepta == true) await _responder(true);
  }

  Future<void> _rechazar() async {
    final motivo = await showDialog<String>(
      context: context,
      builder: (_) => const _ConfirmarRechazo(),
    );
    if (mounted && motivo != null) await _responder(false, motivo: motivo);
  }

  @override
  Widget build(BuildContext context) {
    final tema = FlutterFlowTheme.of(context);
    final vence = widget.solicitud.data()['venceEn'];
    if (vence is! Timestamp || !vence.toDate().isAfter(DateTime.now())) {
      return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: _textoChico(context, 'Esta cotización ya venció.'),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              SizedBox(
                height: 52,
                child: OutlinedButton(
                  onPressed: _guardando ? null : _rechazar,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: tema.error,
                    side: BorderSide(color: tema.error),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text('Rechazar'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _botonPrincipal(
                  context,
                  'Aceptar cotización',
                  _guardando ? null : _aceptar,
                ),
              ),
            ],
          ),
          if (_error != null) _mensajeError(context, _error!),
        ],
      ),
    );
  }
}

class _ConfirmarRechazo extends StatefulWidget {
  const _ConfirmarRechazo();

  @override
  State<_ConfirmarRechazo> createState() => _ConfirmarRechazoState();
}

class _ConfirmarRechazoState extends State<_ConfirmarRechazo> {
  String _motivo = '';

  @override
  Widget build(BuildContext context) {
    return _dialogo(
      context,
      titulo: '¿Rechazar la cotización?',
      contenido: TextField(
        style: FlutterFlowTheme.of(context).bodyMedium,
        decoration: const InputDecoration(labelText: 'Motivo (opcional)'),
        maxLength: 500,
        onChanged: (texto) => _motivo = texto.trim(),
      ),
      accion: 'Confirmar rechazo',
      alConfirmar: () => Navigator.pop(context, _motivo),
      peligro: true,
    );
  }
}
