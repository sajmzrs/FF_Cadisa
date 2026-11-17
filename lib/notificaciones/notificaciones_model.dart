import '/components/notification_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'notificaciones_widget.dart' show NotificacionesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificacionesModel extends FlutterFlowModel<NotificacionesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NotificationItem.
  late NotificationItemModel notificationItemModel1;
  // Model for NotificationItem.
  late NotificationItemModel notificationItemModel2;
  // Model for NotificationItem.
  late NotificationItemModel notificationItemModel3;
  // Model for NotificationItem.
  late NotificationItemModel notificationItemModel4;

  @override
  void initState(BuildContext context) {
    notificationItemModel1 =
        createModel(context, () => NotificationItemModel());
    notificationItemModel2 =
        createModel(context, () => NotificationItemModel());
    notificationItemModel3 =
        createModel(context, () => NotificationItemModel());
    notificationItemModel4 =
        createModel(context, () => NotificationItemModel());
  }

  @override
  void dispose() {
    notificationItemModel1.dispose();
    notificationItemModel2.dispose();
    notificationItemModel3.dispose();
    notificationItemModel4.dispose();
  }
}
