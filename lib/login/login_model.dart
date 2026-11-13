import '/components/cadisa_input_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CadisaInput.
  late CadisaInputModel cadisaInputModel1;
  // Model for CadisaInput.
  late CadisaInputModel cadisaInputModel2;

  @override
  void initState(BuildContext context) {
    cadisaInputModel1 = createModel(context, () => CadisaInputModel());
    cadisaInputModel2 = createModel(context, () => CadisaInputModel());
  }

  @override
  void dispose() {
    cadisaInputModel1.dispose();
    cadisaInputModel2.dispose();
  }
}
