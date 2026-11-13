import '/components/rating_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calificar_servicio_widget.dart' show CalificarServicioWidget;
import 'package:flutter/material.dart';

class CalificarServicioModel extends FlutterFlowModel<CalificarServicioWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for RatingChip.
  late RatingChipModel ratingChipModel1;
  // Model for RatingChip.
  late RatingChipModel ratingChipModel2;
  // Model for RatingChip.
  late RatingChipModel ratingChipModel3;
  // Model for RatingChip.
  late RatingChipModel ratingChipModel4;
  // Model for RatingChip.
  late RatingChipModel ratingChipModel5;

  @override
  void initState(BuildContext context) {
    ratingChipModel1 = createModel(context, () => RatingChipModel());
    ratingChipModel2 = createModel(context, () => RatingChipModel());
    ratingChipModel3 = createModel(context, () => RatingChipModel());
    ratingChipModel4 = createModel(context, () => RatingChipModel());
    ratingChipModel5 = createModel(context, () => RatingChipModel());
  }

  @override
  void dispose() {
    ratingChipModel1.dispose();
    ratingChipModel2.dispose();
    ratingChipModel3.dispose();
    ratingChipModel4.dispose();
    ratingChipModel5.dispose();
  }
}
