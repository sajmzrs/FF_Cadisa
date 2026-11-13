import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quote_row2_model.dart';
export 'quote_row2_model.dart';

class QuoteRow2Widget extends StatefulWidget {
  const QuoteRow2Widget({
    super.key,
    String? label,
    bool? isBold,
    String? value,
    Color? textColor,
  })  : this.label = label ?? 'Lavado de alfombras (35 m²)',
        this.isBold = isBold ?? false,
        this.value = value ?? '₡55 752',
        this.textColor = textColor ?? const Color(0x00000000);

  final String label;
  final bool isBold;
  final String value;
  final Color textColor;

  @override
  State<QuoteRow2Widget> createState() => _QuoteRow2WidgetState();
}

class _QuoteRow2WidgetState extends State<QuoteRow2Widget> {
  late QuoteRow2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuoteRow2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            valueOrDefault<String>(
              widget.label,
              'Lavado de alfombras (35 m²)',
            ),
            maxLines: 1,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.rosario(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  lineHeight: 1.4,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          valueOrDefault<String>(
            widget.value,
            '₡55 752',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.rosario(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: widget.textColor,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                lineHeight: 1.4,
              ),
        ),
      ].divide(SizedBox(width: 16.0)),
    );
  }
}
