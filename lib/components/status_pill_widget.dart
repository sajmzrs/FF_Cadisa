import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'status_pill_model.dart';
export 'status_pill_model.dart';

class StatusPillWidget extends StatefulWidget {
  const StatusPillWidget({
    super.key,
    Color? bgColor,
    String? label,
    Color? textColor,
  })  : this.bgColor = bgColor ?? const Color(0x00000000),
        this.label = label ?? '',
        this.textColor = textColor ?? const Color(0x00000000);

  final Color bgColor;
  final String label;
  final Color textColor;

  @override
  State<StatusPillWidget> createState() => _StatusPillWidgetState();
}

class _StatusPillWidgetState extends State<StatusPillWidget> {
  late StatusPillModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusPillModel());
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
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(20.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 10.0, 4.0, 10.0),
        child: Container(
          child: Text(
            widget.label,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.rosario(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: widget.textColor,
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  lineHeight: 1.4,
                ),
          ),
        ),
      ),
    );
  }
}
