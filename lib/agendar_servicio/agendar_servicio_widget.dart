import '/components/day_box_widget.dart';
import '/components/step_bar2_widget.dart';
import '/components/summary_row_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'agendar_servicio_model.dart';
export 'agendar_servicio_model.dart';

class AgendarServicioWidget extends StatefulWidget {
  const AgendarServicioWidget({super.key});

  static String routeName = 'AgendarServicio';
  static String routePath = '/agendarServicio';

  @override
  State<AgendarServicioWidget> createState() => _AgendarServicioWidgetState();
}

class _AgendarServicioWidgetState extends State<AgendarServicioWidget> {
  late AgendarServicioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendarServicioModel());
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 48.0, 20.0, 16.0),
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      Text(
                        'Fecha del servicio',
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              font: GoogleFonts.rosario(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                              lineHeight: 1.4,
                            ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: wrapWithModel(
                                    model: _model.stepBarModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: StepBar2Widget(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      label: 'Servicio',
                                      isBold: false,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: wrapWithModel(
                                    model: _model.stepBarModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: StepBar2Widget(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      label: 'Fecha',
                                      isBold: true,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: wrapWithModel(
                                    model: _model.stepBarModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: StepBar2Widget(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      label: 'Enviar',
                                      isBold: false,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Octubre 2026',
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
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.4,
                                      ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        wrapWithModel(
                                          model: _model.dayBoxModel1,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'L',
                                            day: '12',
                                            disabled: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.dayBoxModel2,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'K',
                                            day: '13',
                                            disabled: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.dayBoxModel3,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'M',
                                            day: '14',
                                            disabled: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.dayBoxModel4,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'J',
                                            day: '15',
                                            disabled: true,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.dayBoxModel5,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'V',
                                            day: '16',
                                            disabled: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.dayBoxModel6,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: true,
                                            weekday: 'S',
                                            day: '17',
                                            disabled: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.dayBoxModel7,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'D',
                                            day: '18',
                                            disabled: true,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        wrapWithModel(
                                          model: _model.dayBoxModel8,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'L',
                                            day: '19',
                                            disabled: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.dayBoxModel9,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'K',
                                            day: '20',
                                            disabled: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.dayBoxModel10,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'M',
                                            day: '21',
                                            disabled: true,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.dayBoxModel11,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'J',
                                            day: '22',
                                            disabled: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.dayBoxModel12,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'V',
                                            day: '23',
                                            disabled: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.dayBoxModel13,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'S',
                                            day: '24',
                                            disabled: false,
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.dayBoxModel14,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: DayBoxWidget(
                                            selected: false,
                                            weekday: 'D',
                                            day: '25',
                                            disabled: true,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                                Text(
                                  'Los días tachados no tienen cuadrillas disponibles.',
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
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.4,
                                      ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Franja horaria',
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
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.4,
                                      ),
                                ),
                                Container(
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE6EEF8),
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.radio_button_checked_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                          Text(
                                            '8:00 a. m. – 12:00 m. d.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.rosario(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0xFFE2E4DC),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons
                                                .radio_button_unchecked_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20.0,
                                          ),
                                          Text(
                                            '1:00 p. m. – 5:00 p. m.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.rosario(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Resumen',
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
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.4,
                                      ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(14.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0xFFE2E4DC),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(24.0),
                                    child: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          wrapWithModel(
                                            model: _model.summaryRowModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: SummaryRowWidget(
                                              label: 'Servicio',
                                              value: 'Lavado de alfombras',
                                            ),
                                          ),
                                          Divider(
                                            height: 16.0,
                                            thickness: 1.0,
                                            indent: 0.0,
                                            endIndent: 0.0,
                                            color: Color(0xFFE2E4DC),
                                          ),
                                          wrapWithModel(
                                            model: _model.summaryRowModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: SummaryRowWidget(
                                              label: 'Inmueble',
                                              value: 'Residencial · 35 m²',
                                            ),
                                          ),
                                          Divider(
                                            height: 16.0,
                                            thickness: 1.0,
                                            indent: 0.0,
                                            endIndent: 0.0,
                                            color: Color(0xFFE2E4DC),
                                          ),
                                          wrapWithModel(
                                            model: _model.summaryRowModel3,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: SummaryRowWidget(
                                              label: 'Dirección',
                                              value: 'Curridabat, San José',
                                            ),
                                          ),
                                          Divider(
                                            height: 16.0,
                                            thickness: 1.0,
                                            indent: 0.0,
                                            endIndent: 0.0,
                                            color: Color(0xFFE2E4DC),
                                          ),
                                          wrapWithModel(
                                            model: _model.summaryRowModel4,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: SummaryRowWidget(
                                              label: 'Fecha',
                                              value: 'sáb 17 oct · 8:00 a. m.',
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 24.0),
                              child: Container(
                                child: Container(
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(14.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Enviar solicitud',
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
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
