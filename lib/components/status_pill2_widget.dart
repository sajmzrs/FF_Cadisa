import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'status_pill2_model.dart';
export 'status_pill2_model.dart';

class StatusPill2Widget extends StatefulWidget {
  const StatusPill2Widget({
    super.key,
    Color? bgColor,
    String? label,
  })  : this.bgColor = bgColor ?? const Color(0xFFF6F1D5),
        this.label = label ?? 'En revisión';

  final Color bgColor;
  final String label;

  @override
  State<StatusPill2Widget> createState() => _StatusPill2WidgetState();
}

class _StatusPill2WidgetState extends State<StatusPill2Widget> {
  late StatusPill2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusPill2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget.bgColor,
          Color(0xFFF6F1D5),
        ),
        borderRadius: BorderRadius.circular(8.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
        child: Container(
          child: Text(
            valueOrDefault<String>(
              widget.label,
              'En revisión',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.rosario(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  lineHeight: 1.4,
                ),
          ),
        ),
      ),
    );
  }
}
