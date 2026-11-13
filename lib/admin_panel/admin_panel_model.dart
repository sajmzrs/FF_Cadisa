import '/components/kpi_card_widget.dart';
import '/components/request_card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_panel_widget.dart' show AdminPanelWidget;
import 'package:flutter/material.dart';

class AdminPanelModel extends FlutterFlowModel<AdminPanelWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for KpiCard.
  late KpiCardModel kpiCardModel1;
  // Model for KpiCard.
  late KpiCardModel kpiCardModel2;
  // Model for KpiCard.
  late KpiCardModel kpiCardModel3;
  // Model for RequestCard.
  late RequestCard2Model requestCardModel1;
  // Model for RequestCard.
  late RequestCard2Model requestCardModel2;
  // Model for RequestCard.
  late RequestCard2Model requestCardModel3;

  @override
  void initState(BuildContext context) {
    kpiCardModel1 = createModel(context, () => KpiCardModel());
    kpiCardModel2 = createModel(context, () => KpiCardModel());
    kpiCardModel3 = createModel(context, () => KpiCardModel());
    requestCardModel1 = createModel(context, () => RequestCard2Model());
    requestCardModel2 = createModel(context, () => RequestCard2Model());
    requestCardModel3 = createModel(context, () => RequestCard2Model());
  }

  @override
  void dispose() {
    kpiCardModel1.dispose();
    kpiCardModel2.dispose();
    kpiCardModel3.dispose();
    requestCardModel1.dispose();
    requestCardModel2.dispose();
    requestCardModel3.dispose();
  }
}
