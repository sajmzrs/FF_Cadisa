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
import 'servicio_detalle_widget.dart' show ServicioDetalleWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ServicioDetalleModel extends FlutterFlowModel<ServicioDetalleWidget> {
  ///  Local state fields for this page.

  ServicioDetalleDatosStruct? servicioCargado;
  void updateServicioCargadoStruct(
      Function(ServicioDetalleDatosStruct) updateFn) {
    updateFn(servicioCargado ??= ServicioDetalleDatosStruct());
  }

  bool? consultaTerminada = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - leerServicioParaDetalle] action in ServicioDetalle widget.
  ServicioDetalleDatosStruct? datosDelServicio;
  // Model for InfoBox.
  late InfoBoxModel infoBoxModel1;
  // Model for InfoBox.
  late InfoBoxModel infoBoxModel2;
  // State field(s) for EntornoIndustrial widget.
  FormFieldController<List<String>>? entornoIndustrialValueController;
  String? get entornoIndustrialValue =>
      entornoIndustrialValueController?.value?.firstOrNull;
  set entornoIndustrialValue(String? val) =>
      entornoIndustrialValueController?.value = val != null ? [val] : [];
  // Models for InclusionItem.
  late FlutterFlowDynamicModels<InclusionItemModel> inclusionItemModels;

  @override
  void initState(BuildContext context) {
    infoBoxModel1 = createModel(context, () => InfoBoxModel());
    infoBoxModel2 = createModel(context, () => InfoBoxModel());
    inclusionItemModels = FlutterFlowDynamicModels(() => InclusionItemModel());
  }

  @override
  void dispose() {
    infoBoxModel1.dispose();
    infoBoxModel2.dispose();
    inclusionItemModels.dispose();
  }
}
