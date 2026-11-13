import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'photo_box_model.dart';
export 'photo_box_model.dart';

class PhotoBoxWidget extends StatefulWidget {
  const PhotoBoxWidget({
    super.key,
    Color? bgColor,
    Color? borderColor,
    this.icon,
    Color? iconColor,
  })  : this.bgColor = bgColor ?? const Color(0xFFEFF4DD),
        this.borderColor = borderColor ?? const Color(0x00000000),
        this.iconColor = iconColor ?? const Color(0x00000000);

  final Color bgColor;
  final Color borderColor;
  final Widget? icon;
  final Color iconColor;

  @override
  State<PhotoBoxWidget> createState() => _PhotoBoxWidgetState();
}

class _PhotoBoxWidgetState extends State<PhotoBoxWidget> {
  late PhotoBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoBoxModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.0,
      height: 72.0,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget.bgColor,
          Color(0xFFEFF4DD),
        ),
        borderRadius: BorderRadius.circular(12.0),
        shape: BoxShape.rectangle,
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: widget.icon!,
    );
  }
}
