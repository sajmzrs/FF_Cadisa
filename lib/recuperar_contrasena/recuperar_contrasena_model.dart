import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'recuperar_contrasena_widget.dart' show RecuperarContrasenaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecuperarContrasenaModel
    extends FlutterFlowModel<RecuperarContrasenaWidget> {
  ///  Local state fields for this page.

  bool? enlaceEnviado = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailRecuperacionField widget.
  FocusNode? emailRecuperacionFieldFocusNode;
  TextEditingController? emailRecuperacionFieldTextController;
  String? Function(BuildContext, String?)?
      emailRecuperacionFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailRecuperacionFieldFocusNode?.dispose();
    emailRecuperacionFieldTextController?.dispose();
  }
}
