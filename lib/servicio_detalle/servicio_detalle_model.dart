import '/components/inclusion_item_widget.dart';
import '/components/info_box_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'servicio_detalle_widget.dart' show ServicioDetalleWidget;
import 'package:flutter/material.dart';

class ServicioDetalleModel extends FlutterFlowModel<ServicioDetalleWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for InfoBox.
  late InfoBoxModel infoBoxModel1;
  // Model for InfoBox.
  late InfoBoxModel infoBoxModel2;
  // Model for InclusionItem.
  late InclusionItemModel inclusionItemModel1;
  // Model for InclusionItem.
  late InclusionItemModel inclusionItemModel2;
  // Model for InclusionItem.
  late InclusionItemModel inclusionItemModel3;
  // Model for InclusionItem.
  late InclusionItemModel inclusionItemModel4;

  @override
  void initState(BuildContext context) {
    infoBoxModel1 = createModel(context, () => InfoBoxModel());
    infoBoxModel2 = createModel(context, () => InfoBoxModel());
    inclusionItemModel1 = createModel(context, () => InclusionItemModel());
    inclusionItemModel2 = createModel(context, () => InclusionItemModel());
    inclusionItemModel3 = createModel(context, () => InclusionItemModel());
    inclusionItemModel4 = createModel(context, () => InclusionItemModel());
  }

  @override
  void dispose() {
    infoBoxModel1.dispose();
    infoBoxModel2.dispose();
    inclusionItemModel1.dispose();
    inclusionItemModel2.dispose();
    inclusionItemModel3.dispose();
    inclusionItemModel4.dispose();
  }
}
