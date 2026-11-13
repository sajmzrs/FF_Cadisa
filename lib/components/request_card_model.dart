import '/components/status_pill_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'request_card_widget.dart' show RequestCardWidget;
import 'package:flutter/material.dart';

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
