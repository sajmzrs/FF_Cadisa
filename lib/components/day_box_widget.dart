import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'day_box_model.dart';
export 'day_box_model.dart';

class DayBoxWidget extends StatefulWidget {
  const DayBoxWidget({
    super.key,
    bool? selected,
    String? weekday,
    String? day,
    bool? disabled,
  })  : this.selected = selected ?? false,
        this.weekday = weekday ?? 'L',
        this.day = day ?? '12',
        this.disabled = disabled ?? false;

  final bool selected;
  final String weekday;
  final String day;
  final bool disabled;

  @override
  State<DayBoxWidget> createState() => _DayBoxWidgetState();
}

class _DayBoxWidgetState extends State<DayBoxWidget> {
  late DayBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DayBoxModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.0,
      height: 56.0,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          valueOrDefault<bool>(
            widget.selected,
            false,
          )
              ? FlutterFlowTheme.of(context).primary
              : FlutterFlowTheme.of(context).secondaryBackground,
          Color(0x00000000),
        ),
        borderRadius: BorderRadius.circular(10.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: valueOrDefault<Color>(
            valueOrDefault<bool>(
              widget.selected,
              false,
            )
                ? FlutterFlowTheme.of(context).primary
                : Color(0xFFE2E4DC),
            Color(0x00000000),
          ),
          width: 1.0,
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            valueOrDefault<String>(
              widget.weekday,
              'L',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.rosario(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: valueOrDefault<Color>(
                    valueOrDefault<bool>(
                      widget.selected,
                      false,
                    )
                        ? Color(0xCCFFFFFF)
                        : FlutterFlowTheme.of(context).secondaryText,
                    Color(0x00000000),
                  ),
                  fontSize: 11.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  lineHeight: 1.4,
                ),
          ),
          Text(
            valueOrDefault<String>(
              widget.day,
              '12',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.rosario(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: valueOrDefault<Color>(
                    () {
                      if (valueOrDefault<bool>(
                        widget.selected,
                        false,
                      )) {
                        return Colors.white;
                      } else if (valueOrDefault<bool>(
                        widget.disabled,
                        false,
                      )) {
                        return Color(0x667A7E72);
                      } else {
                        return FlutterFlowTheme.of(context).primaryText;
                      }
                    }(),
                    Color(0x00000000),
                  ),
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  lineHeight: 1.4,
                ),
          ),
        ].divide(SizedBox(height: 4.0)),
      ),
    );
  }
}
