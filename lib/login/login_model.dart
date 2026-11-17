import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/cadisa_input_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CadisaInput.
  late CadisaInputModel cadisaInputModel1;
  // Model for CadisaInput.
  late CadisaInputModel cadisaInputModel2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? loggedInUserDoc;

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
