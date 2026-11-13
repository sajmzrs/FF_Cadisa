import '/components/request_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'solicitudes_widget.dart' show SolicitudesWidget;
import 'package:flutter/material.dart';

class SolicitudesModel extends FlutterFlowModel<SolicitudesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for RequestCard.
  late RequestCardModel requestCardModel1;
  // Model for RequestCard.
  late RequestCardModel requestCardModel2;
  // Model for RequestCard.
  late RequestCardModel requestCardModel3;

  @override
  void initState(BuildContext context) {
    requestCardModel1 = createModel(context, () => RequestCardModel());
    requestCardModel2 = createModel(context, () => RequestCardModel());
    requestCardModel3 = createModel(context, () => RequestCardModel());
  }

  @override
  void dispose() {
    requestCardModel1.dispose();
    requestCardModel2.dispose();
    requestCardModel3.dispose();
  }
}
