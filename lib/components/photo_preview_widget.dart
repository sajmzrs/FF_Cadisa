import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'photo_preview_model.dart';
export 'photo_preview_model.dart';

class PhotoPreviewWidget extends StatefulWidget {
  const PhotoPreviewWidget({super.key});

  @override
  State<PhotoPreviewWidget> createState() => _PhotoPreviewWidgetState();
}

class _PhotoPreviewWidgetState extends State<PhotoPreviewWidget> {
  late PhotoPreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoPreviewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58.0,
      height: 58.0,
      decoration: BoxDecoration(
        color: Color(0xFFEFF4DD),
        borderRadius: BorderRadius.circular(12.0),
        shape: BoxShape.rectangle,
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Icon(
        Icons.image_rounded,
        color: FlutterFlowTheme.of(context).secondary,
        size: 24.0,
      ),
    );
  }
}
