import '/components/segment_option_widget.dart';
import '/components/step_bar_widget.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'solicitar_cotizacion_widget.dart' show SolicitarCotizacionWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SolicitarCotizacionModel
    extends FlutterFlowModel<SolicitarCotizacionWidget> {
  ///  Local state fields for this page.

  String? tipoInmueble = '';

  ///  State fields for stateful widgets in this page.

  // Model for StepBar.
  late StepBarModel stepBarModel1;
  // Model for StepBar.
  late StepBarModel stepBarModel2;
  // Model for StepBar.
  late StepBarModel stepBarModel3;
  // Model for SegmentOption.
  late SegmentOptionModel segmentOptionModel1;
  // Model for SegmentOption.
  late SegmentOptionModel segmentOptionModel2;
  // Model for SegmentOption.
  late SegmentOptionModel segmentOptionModel3;
  // State field(s) for AreaDelServicio widget.
  FocusNode? areaDelServicioFocusNode;
  TextEditingController? areaDelServicioTextController;
  String? Function(BuildContext, String?)?
      areaDelServicioTextControllerValidator;
  // State field(s) for DireccionDelServicio widget.
  FocusNode? direccionDelServicioFocusNode;
  TextEditingController? direccionDelServicioTextController;
  String? Function(BuildContext, String?)?
      direccionDelServicioTextControllerValidator;
  // State field(s) for DetallesDelServicio widget.
  FocusNode? detallesDelServicioFocusNode;
  TextEditingController? detallesDelServicioTextController;
  String? Function(BuildContext, String?)?
      detallesDelServicioTextControllerValidator;
  // Stores action output result for [Custom Action - prepararBorradorAgenda] action in Button widget.
  String? validacionDelBorrador;

  @override
  void initState(BuildContext context) {
    stepBarModel1 = createModel(context, () => StepBarModel());
    stepBarModel2 = createModel(context, () => StepBarModel());
    stepBarModel3 = createModel(context, () => StepBarModel());
    segmentOptionModel1 = createModel(context, () => SegmentOptionModel());
    segmentOptionModel2 = createModel(context, () => SegmentOptionModel());
    segmentOptionModel3 = createModel(context, () => SegmentOptionModel());
  }

  @override
  void dispose() {
    stepBarModel1.dispose();
    stepBarModel2.dispose();
    stepBarModel3.dispose();
    segmentOptionModel1.dispose();
    segmentOptionModel2.dispose();
    segmentOptionModel3.dispose();
    areaDelServicioFocusNode?.dispose();
    areaDelServicioTextController?.dispose();

    direccionDelServicioFocusNode?.dispose();
    direccionDelServicioTextController?.dispose();

    detallesDelServicioFocusNode?.dispose();
    detallesDelServicioTextController?.dispose();
  }
}
