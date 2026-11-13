import '/components/contact_card_widget.dart';
import '/components/faq_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contacto_widget.dart' show ContactoWidget;
import 'package:flutter/material.dart';

class ContactoModel extends FlutterFlowModel<ContactoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ContactCard.
  late ContactCardModel contactCardModel1;
  // Model for ContactCard.
  late ContactCardModel contactCardModel2;
  // Model for ContactCard.
  late ContactCardModel contactCardModel3;
  // Model for FaqRow.
  late FaqRowModel faqRowModel1;
  // Model for FaqRow.
  late FaqRowModel faqRowModel2;

  @override
  void initState(BuildContext context) {
    contactCardModel1 = createModel(context, () => ContactCardModel());
    contactCardModel2 = createModel(context, () => ContactCardModel());
    contactCardModel3 = createModel(context, () => ContactCardModel());
    faqRowModel1 = createModel(context, () => FaqRowModel());
    faqRowModel2 = createModel(context, () => FaqRowModel());
  }

  @override
  void dispose() {
    contactCardModel1.dispose();
    contactCardModel2.dispose();
    contactCardModel3.dispose();
    faqRowModel1.dispose();
    faqRowModel2.dispose();
  }
}
