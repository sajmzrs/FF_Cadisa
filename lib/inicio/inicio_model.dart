import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/category_tile_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'inicio_widget.dart' show InicioWidget;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InicioModel extends FlutterFlowModel<InicioWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Inicio widget.
  UsersRecord? perfilInicio;
  // Model for CategoryTile.
  late CategoryTileModel categoryTileModel1;
  // Model for CategoryTile.
  late CategoryTileModel categoryTileModel2;
  // Model for CategoryTile.
  late CategoryTileModel categoryTileModel3;
  // Model for CategoryTile.
  late CategoryTileModel categoryTileModel4;
  // Model for CategoryTile.
  late CategoryTileModel categoryTileModel5;
  // Model for CategoryTile.
  late CategoryTileModel categoryTileModel6;

  @override
  void initState(BuildContext context) {
    categoryTileModel1 = createModel(context, () => CategoryTileModel());
    categoryTileModel2 = createModel(context, () => CategoryTileModel());
    categoryTileModel3 = createModel(context, () => CategoryTileModel());
    categoryTileModel4 = createModel(context, () => CategoryTileModel());
    categoryTileModel5 = createModel(context, () => CategoryTileModel());
    categoryTileModel6 = createModel(context, () => CategoryTileModel());
  }

  @override
  void dispose() {
    categoryTileModel1.dispose();
    categoryTileModel2.dispose();
    categoryTileModel3.dispose();
    categoryTileModel4.dispose();
    categoryTileModel5.dispose();
    categoryTileModel6.dispose();
  }
}
