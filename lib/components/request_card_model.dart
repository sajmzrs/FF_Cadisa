import '/components/status_pill_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'request_card_widget.dart' show RequestCardWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RequestCardModel extends FlutterFlowModel<RequestCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for StatusPill.
  late StatusPillModel statusPillModel;

  @override
  void initState(BuildContext context) {
    statusPillModel = createModel(context, () => StatusPillModel());
  }

  @override
  void dispose() {
    statusPillModel.dispose();
  }
}
