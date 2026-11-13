import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'step_bar_model.dart';
export 'step_bar_model.dart';

class StepBarWidget extends StatefulWidget {
  const StepBarWidget({
    super.key,
    Color? color,
    String? label,
    bool? active,
  })  : this.color = color ?? const Color(0x00000000),
        this.label = label ?? 'Servicio',
        this.active = active ?? true;

  final Color color;
  final String label;
  final bool active;

  @override
  State<StepBarWidget> createState() => _StepBarWidgetState();
}

class _StepBarWidgetState extends State<StepBarWidget> {
  late StepBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              widget.color,
              FlutterFlowTheme.of(context).secondary,
            ),
            borderRadius: BorderRadius.circular(4.0),
            shape: BoxShape.rectangle,
          ),
        ),
        Text(
          valueOrDefault<String>(
            widget.label,
            'Servicio',
          ),
          style: FlutterFlowTheme.of(context).labelSmall.override(
                font: GoogleFonts.rosario(
                  fontWeight:
                      FlutterFlowTheme.of(context).labelSmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                ),
                color: valueOrDefault<Color>(
                  valueOrDefault<bool>(
                    widget.active,
                    true,
                  )
                      ? FlutterFlowTheme.of(context).secondary
                      : FlutterFlowTheme.of(context).secondaryText,
                  FlutterFlowTheme.of(context).secondary,
                ),
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                lineHeight: 1.4,
              ),
        ),
      ].divide(SizedBox(height: 4.0)),
    );
  }
}
