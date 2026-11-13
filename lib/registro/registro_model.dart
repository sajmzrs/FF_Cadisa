import '/components/cadisa_input2_widget.dart';
import '/components/toggle_option_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'registro_widget.dart' show RegistroWidget;
import 'package:flutter/material.dart';

class RegistroModel extends FlutterFlowModel<RegistroWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ToggleOption.
  late ToggleOptionModel toggleOptionModel1;
  // Model for ToggleOption.
  late ToggleOptionModel toggleOptionModel2;
  // Model for CadisaInput.
  late CadisaInput2Model cadisaInputModel1;
  // Model for CadisaInput.
  late CadisaInput2Model cadisaInputModel2;
  // Model for CadisaInput.
  late CadisaInput2Model cadisaInputModel3;
  // Model for CadisaInput.
  late CadisaInput2Model cadisaInputModel4;
  // Model for CadisaInput.
  late CadisaInput2Model cadisaInputModel5;

  @override
  void initState(BuildContext context) {
    toggleOptionModel1 = createModel(context, () => ToggleOptionModel());
    toggleOptionModel2 = createModel(context, () => ToggleOptionModel());
    cadisaInputModel1 = createModel(context, () => CadisaInput2Model());
    cadisaInputModel2 = createModel(context, () => CadisaInput2Model());
    cadisaInputModel3 = createModel(context, () => CadisaInput2Model());
    cadisaInputModel4 = createModel(context, () => CadisaInput2Model());
    cadisaInputModel5 = createModel(context, () => CadisaInput2Model());
  }

  @override
  void dispose() {
    toggleOptionModel1.dispose();
    toggleOptionModel2.dispose();
    cadisaInputModel1.dispose();
    cadisaInputModel2.dispose();
    cadisaInputModel3.dispose();
    cadisaInputModel4.dispose();
    cadisaInputModel5.dispose();
  }
}
