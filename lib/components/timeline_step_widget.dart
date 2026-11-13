import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'timeline_step_model.dart';
export 'timeline_step_model.dart';

class TimelineStepWidget extends StatefulWidget {
  const TimelineStepWidget({
    super.key,
    bool? completed,
  }) : this.completed = completed ?? true;

  final bool completed;

  @override
  State<TimelineStepWidget> createState() => _TimelineStepWidgetState();
}

class _TimelineStepWidgetState extends State<TimelineStepWidget> {
  late TimelineStepModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimelineStepModel());
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional(0.0, 0.0),
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
              child: Container(
                child: Container(
                  width: 60.0,
                  height: 2.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      valueOrDefault<bool>(
                        widget.completed,
                        true,
                      )
                          ? FlutterFlowTheme.of(context).secondary
                          : Color(0xFFE2E4DC),
                      FlutterFlowTheme.of(context).secondary,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
            ),
            Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9999.0),
                shape: BoxShape.rectangle,
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Visibility(
                visible: valueOrDefault<bool>(
                  widget.completed,
                  true,
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
            ),
          ],
        ),
      ].divide(SizedBox(height: 4.0)),
    );
  }
}
