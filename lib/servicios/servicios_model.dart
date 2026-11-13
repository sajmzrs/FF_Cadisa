import '/components/service_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'servicios_widget.dart' show ServiciosWidget;
import 'package:flutter/material.dart';

class ServiciosModel extends FlutterFlowModel<ServiciosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ServiceCard.
  late ServiceCardModel serviceCardModel1;
  // Model for ServiceCard.
  late ServiceCardModel serviceCardModel2;
  // Model for ServiceCard.
  late ServiceCardModel serviceCardModel3;
  // Model for ServiceCard.
  late ServiceCardModel serviceCardModel4;
  // Model for ServiceCard.
  late ServiceCardModel serviceCardModel5;
  // Model for ServiceCard.
  late ServiceCardModel serviceCardModel6;

  @override
  void initState(BuildContext context) {
    serviceCardModel1 = createModel(context, () => ServiceCardModel());
    serviceCardModel2 = createModel(context, () => ServiceCardModel());
    serviceCardModel3 = createModel(context, () => ServiceCardModel());
    serviceCardModel4 = createModel(context, () => ServiceCardModel());
    serviceCardModel5 = createModel(context, () => ServiceCardModel());
    serviceCardModel6 = createModel(context, () => ServiceCardModel());
  }

  @override
  void dispose() {
    serviceCardModel1.dispose();
    serviceCardModel2.dispose();
    serviceCardModel3.dispose();
    serviceCardModel4.dispose();
    serviceCardModel5.dispose();
    serviceCardModel6.dispose();
  }
}
