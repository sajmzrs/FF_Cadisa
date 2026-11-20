import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/inclusion_item_widget.dart';
import '/components/info_box_widget.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'servicio_detalle_model.dart';
export 'servicio_detalle_model.dart';

class ServicioDetalleWidget extends StatefulWidget {
  const ServicioDetalleWidget({
    super.key,
    String? servicioId,
  }) : this.servicioId = servicioId ?? '';

  /// Identificador del servicio seleccionado.
  final String servicioId;

  static String routeName = 'ServicioDetalle';
  static String routePath = '/servicioDetalle';

  @override
  State<ServicioDetalleWidget> createState() => _ServicioDetalleWidgetState();
}

class _ServicioDetalleWidgetState extends State<ServicioDetalleWidget> {
  late ServicioDetalleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServicioDetalleModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.datosDelServicio = await actions.leerServicioParaDetalle(
        widget!.servicioId,
      );
      _model.servicioCargado = _model.datosDelServicio;
      safeSetState(() {});
      _model.consultaTerminada = true;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          title: Text(
            _model.servicioCargado?.disponible == true
                ? _model.servicioCargado!.categoria
                : 'Detalle del servicio',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.rosario(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  lineHeight: 1.4,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!(_model.servicioCargado?.disponible == true))
                      Text(
                        _model.consultaTerminada!
                            ? 'Este servicio no está disponible.'
                            : 'Cargando servicio…',
                        style: TextStyle(),
                      ),
                    if (_model.servicioCargado?.disponible == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 100.0),
                        child: Container(
                          child: Visibility(
                            visible: _model.servicioCargado?.disponible == true,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF4DD),
                                    borderRadius: BorderRadius.circular(18.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.texture_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 64.0,
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _model.servicioCargado!.titulo,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rosario(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                    Text(
                                      _model.servicioCargado!.precio,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rosario(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                                Text(
                                  _model.servicioCargado!.descripcion,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.rosario(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.5,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: wrapWithModel(
                                        model: _model.infoBoxModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: InfoBoxWidget(
                                          icon: Icon(
                                            Icons.schedule_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 20.0,
                                          ),
                                          label: 'Duración',
                                          value:
                                              _model.servicioCargado?.duracion,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: wrapWithModel(
                                        model: _model.infoBoxModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: InfoBoxWidget(
                                          icon: Icon(
                                            Icons.help,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 20.0,
                                          ),
                                          label: 'Productos',
                                          value: '100% biodegradables',
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Disponible para',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.rosario(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          if (_model.servicioCargado
                                                  ?.residencial ??
                                              true)
                                            Container(
                                              height: 34.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEFF4DD),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.check_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 18.0,
                                                    ),
                                                    Text(
                                                      'Residencial',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .rosario(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.4,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 6.0)),
                                                ),
                                              ),
                                            ),
                                          if (_model
                                                  .servicioCargado?.comercial ??
                                              true)
                                            Container(
                                              height: 34.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEFF4DD),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.check_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 18.0,
                                                    ),
                                                    Text(
                                                      'Comercial',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .rosario(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.4,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 6.0)),
                                                ),
                                              ),
                                            ),
                                          if (_model.servicioCargado
                                                  ?.industrial ??
                                              true)
                                            FlutterFlowChoiceChips(
                                              options: [ChipData('Industrial')],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                          .entornoIndustrialValue =
                                                      val?.firstOrNull),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 0.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 8.0,
                                                            12.0, 8.0),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0x00000000),
                                                textStyle: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 0.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 8.0,
                                                            12.0, 8.0),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              chipSpacing: 0.0,
                                              multiselect: false,
                                              controller: _model
                                                      .entornoIndustrialValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [],
                                              ),
                                              wrapped: false,
                                            ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '¿Qué incluye?',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.rosario(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final item = _model
                                                .servicioCargado?.inclusiones
                                                ?.toList() ??
                                            [];

                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: List.generate(item.length,
                                              (itemIndex) {
                                            final itemItem = item[itemIndex];
                                            return wrapWithModel(
                                              model: _model.inclusionItemModels
                                                  .getModel(
                                                itemIndex.toString(),
                                                itemIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InclusionItemWidget(
                                                key: Key(
                                                  'Keygoq_${itemIndex.toString()}',
                                                ),
                                                label: itemItem,
                                              ),
                                            );
                                          }).divide(SizedBox(height: 6.0)),
                                        );
                                      },
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE6EEF8),
                                    borderRadius: BorderRadius.circular(14.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.info_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              'El precio final depende del área y el estado. Lo confirmamos en la cotización.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    font: GoogleFonts.rosario(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                    lineHeight: 1.4,
                                                  ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    child: Visibility(
                      visible: _model.servicioCargado?.disponible == true,
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            SolicitarCotizacionWidget.routeName,
                            queryParameters: {
                              'servicioId': serializeParam(
                                widget!.servicioId,
                                ParamType.String,
                              ),
                              'servicioTitulo': serializeParam(
                                _model.servicioCargado?.titulo,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        text: 'Solicitar cotización',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 44.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
