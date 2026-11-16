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
          return const Padding(
            padding: EdgeInsets.all(24),
            child: Text('Consultá Mis solicitudes para verificar el envío.'),
          );
        }
        final tema = FlutterFlowTheme.of(context);
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outline, size: 56, color: tema.primary),
              Text('¡Solicitud enviada!', style: tema.titleLarge),
              SelectableText(widget.codigo!),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => context.goNamed('Solicitudes'),
                child: const Text('Ver mis solicitudes'),
              ),
            ],
          ),
        );
      },
    );
  }
}

DateTime _horaCostaRica(DateTime hora) =>
    hora.toUtc().subtract(const Duration(hours: 6));

DateTime _diaCostaRica(DateTime hora) {
  final local = _horaCostaRica(hora);
  return DateTime.utc(local.year, local.month, local.day);
}

String _fecha(DateTime fecha) => DateFormat('dd/MM/yyyy').format(fecha);

String _horario(String franja) =>
    franja == 'manana' ? '8:00 a. m. – 12:00 m. d.' : '1:00 p. m. – 5:00 p. m.';

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
  static const diasSemana = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];
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

  @override
  Widget build(BuildContext context) {
    final codigo = _codigo;
    if (codigo != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 56,
                color: FlutterFlowTheme.of(context).primary,
              ),
              const Text('¡Solicitud enviada!'),
              SelectableText(codigo),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => context.goNamed('Solicitudes'),
                child: const Text('Ver mis solicitudes'),
              ),
              TextButton(
                onPressed: () => context.goNamed('Inicio'),
                child: const Text('Volver al inicio'),
              ),
            ],
          ),
        ),
      );
    }
    if (!_borradorValido) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Volvé al formulario y completá los datos de la solicitud.',
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
          return const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'No se pudo cargar el servicio. Volvé al catálogo para intentar de nuevo.',
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
            final inicio = _fecha(_hoy);
            final fin = _fecha(_hoy.add(const Duration(days: 13)));
            return ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              children: [
                Text(
                  'Fecha · $inicio al $fin',
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
                const SizedBox(height: 8),
                for (var semana = 0; semana < 2; semana++)
                  Row(
                    children: [
                      for (var i = 0; i < 7; i++)
                        Expanded(
                          child: _botonDia(
                            _hoy.add(Duration(days: semana * 7 + i)),
                            porDia,
                          ),
                        ),
                    ],
                  ),
                if (cupos.isEmpty)
                  const Text(
                    'No hay fechas disponibles en las próximas dos semanas.',
                  ),
                const SizedBox(height: 16),
                Text(
                  'Franja horaria',
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
                const SizedBox(height: 8),
                if (franjas.isEmpty)
                  const Text('Seleccioná una fecha disponible.'),
                for (final cupo in franjas)
                  ChoiceChip(
                    label: Text(_horario(cupo.franja)),
                    selected: elegido?.id == cupo.id,
                    onSelected: _enviando
                        ? null
                        : (_) => setState(() {
                              _cupoId = cupo.id;
                              _error = null;
                            }),
                  ),
                const SizedBox(height: 16),
                Text(
                  'Resumen',
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(datos['titulo']?.toString() ?? 'Servicio'),
                  subtitle: Text(
                    '${_borrador.tipoInmueble} · ${_borrador.areaCantidad}\n'
                    '${_borrador.direccion}'
                    '${elegido == null ? '' : '\n${_fecha(_horaCostaRica(elegido.inicio))} · ${_horario(elegido.franja)}'}',
                  ),
                ),
                const Text(
                  'La fecha es una preferencia. CADISA confirmará la visita después de cotizar.',
                ),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      _error!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: elegido == null || _enviando
                      ? null
                      : () => _enviar(elegido),
                  child: Text(_enviando ? 'Enviando…' : 'Enviar solicitud'),
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
    return Tooltip(
      message: '${_fecha(dia)}${disponible ? '' : ' · Sin cupo'}',
      child: ChoiceChip(
        labelPadding: EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 3),
        showCheckmark: false,
        selected: _dia == dia && disponible,
        label: Text(
          '${diasSemana[dia.weekday - 1]}\n${dia.day}',
          textAlign: TextAlign.center,
        ),
        onSelected: disponible && !_enviando
            ? (_) => setState(() {
                  _dia = dia;
                  _cupoId = null;
                  _error = null;
                })
            : null,
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
  static const _etapas = [
    'En revisión',
    'Cotización lista',
    'Confirmada',
    'En proceso',
    'Finalizada',
  ];
  final _titulos = <String, Future<String>>{};
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

  Future<String> _titulo(Map<String, dynamic> datos) async {
    final ref = datos['servicioRef'];
    if (ref is! DocumentReference) return 'Servicio';
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

  String _fechaSolicitud(Map<String, dynamic> datos) {
    final fecha = datos['fechaPreferida'];
    return fecha is Timestamp
        ? _fecha(_horaCostaRica(fecha.toDate()))
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
    final datos = solicitud.data();
    final estado = datos['estado']?.toString() ?? 'En revisión';
    final posicion = _etapas.indexOf(estado);
    if (widget.admin && estado == 'En revisión') {
      await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (_) =>
            _FormularioCotizacion(solicitud: solicitud, titulo: titulo),
      );
      return;
    }
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              datos['codigo']?.toString() ?? '',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            Text(titulo),
            Text('${_fechaSolicitud(datos)} · ${datos['direccion'] ?? ''}'),
            const SizedBox(height: 12),
            Text('Estado: $estado'),
            if (datos['cotizadaEn'] is Timestamp) _ResumenCotizacion(datos),
            if (!widget.admin && estado == 'Cotización lista')
              _RespuestaCotizacion(solicitud: solicitud),
            if (posicion >= 0)
              for (var i = 0; i < _etapas.length; i++)
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    i <= posicion ? Icons.check_circle : Icons.circle_outlined,
                  ),
                  title: Text(_etapas[i]),
                ),
            if (posicion < 0)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.info_outline),
                title: Text(estado),
              ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar'),
            ),
          ],
        ),
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
    final promedio = calificadas == 0
        ? 'Sin calificaciones'
        : '${(suma / calificadas).toStringAsFixed(1)} / 5';
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
      child: Wrap(
        spacing: 8,
        runSpacing: 6,
        children: [
          Chip(label: Text('$porCotizar por cotizar')),
          Chip(label: Text('$citas citas esta semana')),
          Chip(label: Text(promedio)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_solicitudes == null) {
      return const Center(
        child: Text('Iniciá sesión para ver tus solicitudes.'),
      );
    }
    return Column(
      children: [
        if (widget.admin)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: Wrap(
              spacing: 8,
              children: [
                for (final filtro in const {
                  'Todas': 'Todas',
                  'En revisión': 'Por cotizar',
                  'Cotización lista': 'Cotizadas',
                  'Confirmada': 'Confirmadas',
                }.entries)
                  ChoiceChip(
                    label: Text(filtro.value),
                    selected: _filtro == filtro.key,
                    onSelected: (_) => setState(() => _filtro = filtro.key),
                  ),
              ],
            ),
          ),
        if (!widget.admin && !widget.avisos)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('Activas'),
                  selected: !_historial,
                  onSelected: (_) => setState(() => _historial = false),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Historial'),
                  selected: _historial,
                  onSelected: (_) => setState(() => _historial = true),
                ),
              ],
            ),
          ),
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
              if (!snapshot.hasData)
                return const Center(child: CircularProgressIndicator());
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
                  if (items.isEmpty)
                    Expanded(child: Center(child: Text(vacio)))
                  else
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 4),
                        itemBuilder: (context, index) {
                          final solicitud = items[index];
                          final datos = solicitud.data();
                          return FutureBuilder<String>(
                            future: _titulo(datos),
                            builder: (context, servicio) {
                              final titulo = servicio.data ?? 'Servicio';
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    widget.avisos
                                        ? 'Cotización recibida · $titulo'
                                        : '$titulo · ${datos['codigo'] ?? ''}',
                                  ),
                                  subtitle: Text(
                                    '${_fechaSolicitud(datos)} · ${datos['direccion'] ?? ''}\n${datos['estado'] ?? ''}',
                                  ),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () => _abrirDetalle(solicitud, titulo),
                                ),
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

String _colones(Object? monto) =>
    '₡${NumberFormat.decimalPattern().format(monto is num ? monto : 0)}';

class _ResumenCotizacion extends StatelessWidget {
  const _ResumenCotizacion(this.datos);

  final Map<String, dynamic> datos;

  @override
  Widget build(BuildContext context) {
    final nota = datos['notaAdmin']?.toString() ?? '';
    final vence = datos['venceEn'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Monto sin IVA: ${_colones(datos['montoSinIva'])}'),
          Text('IVA (13 %): ${_colones(datos['iva'])}'),
          Text(
            'Total: ${_colones(datos['total'])}',
            style: FlutterFlowTheme.of(context).titleMedium,
          ),
          if (vence is Timestamp)
            Text('Vigente hasta el ${_fecha(_horaCostaRica(vence.toDate()))}'),
          if (nota.isNotEmpty) Text(nota),
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

  @override
  Widget build(BuildContext context) {
    final datos = widget.solicitud.data();
    final fecha = datos['fechaPreferida'];
    final monto = _subtotal;
    final iva = monto == null ? 0 : (monto * 13 + 50) ~/ 100;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        24,
        24,
        24,
        24 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Cotizar ${datos['codigo'] ?? ''}',
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          Text(widget.titulo),
          Text(
            '${datos['tipoInmueble']} · ${datos['areaCantidad']} · ${datos['direccion']}',
          ),
          if (fecha is Timestamp)
            Text(
              '${_fecha(_horaCostaRica(fecha.toDate()))} · ${_horario(datos['franja'] as String)}',
            ),
          if ((datos['detalles']?.toString() ?? '').isNotEmpty)
            Text(datos['detalles'].toString()),
          const SizedBox(height: 12),
          TextField(
            controller: _monto,
            enabled: !_guardando,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Monto sin IVA (colones enteros)',
            ),
            onChanged: (_) => setState(() => _error = null),
          ),
          TextField(
            controller: _nota,
            enabled: !_guardando,
            decoration: const InputDecoration(
              labelText: 'Nota para el cliente',
            ),
            maxLines: 3,
            maxLength: 1200,
          ),
          Text('IVA (13 %): ${_colones(iva)}'),
          Text('Total: ${_colones((monto ?? 0) + iva)}'),
          const Text('Vigencia: 7 días'),
          if (_error != null)
            Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed:
                monto == null || _guardando ? null : () => _cotizar(monto),
            child: Text(_guardando ? 'Enviando…' : 'Enviar cotización'),
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

  Future<void> _rechazar() async {
    final motivo = await showDialog<String>(
      context: context,
      builder: (_) => const _ConfirmarRechazo(),
    );
    if (mounted && motivo != null) await _responder(false, motivo: motivo);
  }

  @override
  Widget build(BuildContext context) {
    final vence = widget.solicitud.data()['venceEn'];
    if (vence is! Timestamp || !vence.toDate().isAfter(DateTime.now())) {
      return const Text('Esta cotización ya venció.');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          children: [
            FilledButton(
              onPressed: _guardando ? null : () => _responder(true),
              child: const Text('Aceptar cotización'),
            ),
            TextButton(
              onPressed: _guardando ? null : _rechazar,
              child: const Text('Rechazar'),
            ),
          ],
        ),
        if (_error != null)
          Text(
            _error!,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
      ],
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
    return AlertDialog(
      title: const Text('¿Rechazar la cotización?'),
      content: TextField(
        decoration: const InputDecoration(labelText: 'Motivo (opcional)'),
        maxLength: 500,
        onChanged: (texto) => _motivo = texto.trim(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Volver'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, _motivo),
          child: const Text('Confirmar rechazo'),
        ),
      ],
    );
  }
}
