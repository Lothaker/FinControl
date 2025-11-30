import '/flutter_flow/flutter_flow_util.dart';
import 'saldo_inicial_bottom_sheet_widget.dart'
    show SaldoInicialBottomSheetWidget;
import 'package:flutter/material.dart';

class SaldoInicialBottomSheetModel
    extends FlutterFlowModel<SaldoInicialBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
