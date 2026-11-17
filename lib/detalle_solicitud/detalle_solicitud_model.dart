import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/photo_preview_widget.dart';
import '/components/status_pill2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'detalle_solicitud_widget.dart' show DetalleSolicitudWidget;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetalleSolicitudModel extends FlutterFlowModel<DetalleSolicitudWidget> {
  ///  Local state fields for this page.

  bool? accesoAdminVerificado = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in DetalleSolicitud widget.
  UsersRecord? perfilAcceso;
  // Model for StatusPill.
  late StatusPill2Model statusPillModel;
  // Model for PhotoPreview.
  late PhotoPreviewModel photoPreviewModel1;
  // Model for PhotoPreview.
  late PhotoPreviewModel photoPreviewModel2;
  // Model for PhotoPreview.
  late PhotoPreviewModel photoPreviewModel3;

  @override
  void initState(BuildContext context) {
    statusPillModel = createModel(context, () => StatusPill2Model());
    photoPreviewModel1 = createModel(context, () => PhotoPreviewModel());
    photoPreviewModel2 = createModel(context, () => PhotoPreviewModel());
    photoPreviewModel3 = createModel(context, () => PhotoPreviewModel());
  }

  @override
  void dispose() {
    statusPillModel.dispose();
    photoPreviewModel1.dispose();
    photoPreviewModel2.dispose();
    photoPreviewModel3.dispose();
  }
}
