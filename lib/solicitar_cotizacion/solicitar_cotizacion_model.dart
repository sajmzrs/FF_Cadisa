import '/components/photo_box_widget.dart';
import '/components/segment_option_widget.dart';
import '/components/step_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'solicitar_cotizacion_widget.dart' show SolicitarCotizacionWidget;
import 'package:flutter/material.dart';

class SolicitarCotizacionModel
    extends FlutterFlowModel<SolicitarCotizacionWidget> {
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
  // Model for PhotoBox.
  late PhotoBoxModel photoBoxModel1;
  // Model for PhotoBox.
  late PhotoBoxModel photoBoxModel2;
  // Model for PhotoBox.
  late PhotoBoxModel photoBoxModel3;

  @override
  void initState(BuildContext context) {
    stepBarModel1 = createModel(context, () => StepBarModel());
    stepBarModel2 = createModel(context, () => StepBarModel());
    stepBarModel3 = createModel(context, () => StepBarModel());
    segmentOptionModel1 = createModel(context, () => SegmentOptionModel());
    segmentOptionModel2 = createModel(context, () => SegmentOptionModel());
    segmentOptionModel3 = createModel(context, () => SegmentOptionModel());
    photoBoxModel1 = createModel(context, () => PhotoBoxModel());
    photoBoxModel2 = createModel(context, () => PhotoBoxModel());
    photoBoxModel3 = createModel(context, () => PhotoBoxModel());
  }

  @override
  void dispose() {
    stepBarModel1.dispose();
    stepBarModel2.dispose();
    stepBarModel3.dispose();
    segmentOptionModel1.dispose();
    segmentOptionModel2.dispose();
    segmentOptionModel3.dispose();
    photoBoxModel1.dispose();
    photoBoxModel2.dispose();
    photoBoxModel3.dispose();
  }
}
