import '/components/quote_row2_widget.dart';
import '/components/step_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_cotizar_widget.dart' show AdminCotizarWidget;
import 'package:flutter/material.dart';

class AdminCotizarModel extends FlutterFlowModel<AdminCotizarWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for StepIndicator.
  late StepIndicatorModel stepIndicatorModel1;
  // Model for StepIndicator.
  late StepIndicatorModel stepIndicatorModel2;
  // Model for StepIndicator.
  late StepIndicatorModel stepIndicatorModel3;
  // Model for StepIndicator.
  late StepIndicatorModel stepIndicatorModel4;
  // Model for QuoteRow.
  late QuoteRow2Model quoteRowModel1;
  // Model for QuoteRow.
  late QuoteRow2Model quoteRowModel2;
  // Model for QuoteRow.
  late QuoteRow2Model quoteRowModel3;
  // Model for QuoteRow.
  late QuoteRow2Model quoteRowModel4;

  @override
  void initState(BuildContext context) {
    stepIndicatorModel1 = createModel(context, () => StepIndicatorModel());
    stepIndicatorModel2 = createModel(context, () => StepIndicatorModel());
    stepIndicatorModel3 = createModel(context, () => StepIndicatorModel());
    stepIndicatorModel4 = createModel(context, () => StepIndicatorModel());
    quoteRowModel1 = createModel(context, () => QuoteRow2Model());
    quoteRowModel2 = createModel(context, () => QuoteRow2Model());
    quoteRowModel3 = createModel(context, () => QuoteRow2Model());
    quoteRowModel4 = createModel(context, () => QuoteRow2Model());
  }

  @override
  void dispose() {
    stepIndicatorModel1.dispose();
    stepIndicatorModel2.dispose();
    stepIndicatorModel3.dispose();
    stepIndicatorModel4.dispose();
    quoteRowModel1.dispose();
    quoteRowModel2.dispose();
    quoteRowModel3.dispose();
    quoteRowModel4.dispose();
  }
}
