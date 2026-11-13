import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'step_bar2_model.dart';
export 'step_bar2_model.dart';

class StepBar2Widget extends StatefulWidget {
  const StepBar2Widget({
    super.key,
    Color? color,
    String? label,
    bool? isBold,
  })  : this.color = color ?? const Color(0x00000000),
        this.label = label ?? 'Servicio',
        this.isBold = isBold ?? false;

  final Color color;
  final String label;
  final bool isBold;

  @override
  State<StepBar2Widget> createState() => _StepBar2WidgetState();
}

class _StepBar2WidgetState extends State<StepBar2Widget> {
  late StepBar2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepBar2Model());
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
          height: 4.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              widget.color,
              FlutterFlowTheme.of(context).secondary,
            ),
            borderRadius: BorderRadius.circular(9999.0),
            shape: BoxShape.rectangle,
          ),
        ),
        Text(
          valueOrDefault<String>(
            widget.label,
            'Servicio',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.rosario(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: valueOrDefault<Color>(
                  widget.color,
                  FlutterFlowTheme.of(context).secondary,
                ),
                fontSize: 12.0,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                lineHeight: 1.4,
              ),
        ),
      ].divide(SizedBox(height: 4.0)),
    );
  }
}
