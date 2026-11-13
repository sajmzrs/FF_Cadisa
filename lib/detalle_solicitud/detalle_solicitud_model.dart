import '/components/photo_preview_widget.dart';
import '/components/status_pill2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detalle_solicitud_widget.dart' show DetalleSolicitudWidget;
import 'package:flutter/material.dart';

class DetalleSolicitudModel extends FlutterFlowModel<DetalleSolicitudWidget> {
  ///  State fields for stateful widgets in this page.

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
