import '/components/step_bar3_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'solicitud_enviada_widget.dart' show SolicitudEnviadaWidget;
import 'package:flutter/material.dart';

class SolicitudEnviadaModel extends FlutterFlowModel<SolicitudEnviadaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for StepBar.
  late StepBar3Model stepBarModel1;
  // Model for StepBar.
  late StepBar3Model stepBarModel2;
  // Model for StepBar.
  late StepBar3Model stepBarModel3;

  @override
  void initState(BuildContext context) {
    stepBarModel1 = createModel(context, () => StepBar3Model());
    stepBarModel2 = createModel(context, () => StepBar3Model());
    stepBarModel3 = createModel(context, () => StepBar3Model());
  }

  @override
  void dispose() {
    stepBarModel1.dispose();
    stepBarModel2.dispose();
    stepBarModel3.dispose();
  }
}
