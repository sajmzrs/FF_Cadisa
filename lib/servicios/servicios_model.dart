import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'servicios_widget.dart' show ServiciosWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ServiciosModel extends FlutterFlowModel<ServiciosWidget> {
  ///  Local state fields for this page.

  String? buscar = '';

  String? categoria = '';

  String? entorno = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for BusquedaServicio widget.
  FocusNode? busquedaServicioFocusNode;
  TextEditingController? busquedaServicioTextController;
  String? Function(BuildContext, String?)?
      busquedaServicioTextControllerValidator;
  // State field(s) for FiltroServiciosespeciales widget.
  FormFieldController<List<String>>? filtroServiciosespecialesValueController;
  String? get filtroServiciosespecialesValue =>
      filtroServiciosespecialesValueController?.value?.firstOrNull;
  set filtroServiciosespecialesValue(String? val) =>
      filtroServiciosespecialesValueController?.value =
          val != null ? [val] : [];
  // State field(s) for FiltroVentaInstalacion widget.
  FormFieldController<List<String>>? filtroVentaInstalacionValueController;
  String? get filtroVentaInstalacionValue =>
      filtroVentaInstalacionValueController?.value?.firstOrNull;
  set filtroVentaInstalacionValue(String? val) =>
      filtroVentaInstalacionValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    busquedaServicioFocusNode?.dispose();
    busquedaServicioTextController?.dispose();
  }
}
