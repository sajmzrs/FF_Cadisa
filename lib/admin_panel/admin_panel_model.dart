import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/kpi_card_widget.dart';
import '/components/request_card2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'admin_panel_widget.dart' show AdminPanelWidget;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminPanelModel extends FlutterFlowModel<AdminPanelWidget> {
  ///  Local state fields for this page.

  bool? accesoAdminVerificado = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in AdminPanel widget.
  UsersRecord? perfilAcceso;
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
