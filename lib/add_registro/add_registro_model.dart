import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_registro_widget.dart' show AddRegistroWidget;
import 'package:flutter/material.dart';

class AddRegistroModel extends FlutterFlowModel<AddRegistroWidget> {
  ///  Local state fields for this page.
  /// data do registro
  DateTime? dataSelecionada;

  double? valorRegistro;

  String? tipoRegistro;

  String? descricaoRegistro;

  List<DocumentReference> categoriaLista = [];
  void addToCategoriaLista(DocumentReference item) => categoriaLista.add(item);
  void removeFromCategoriaLista(DocumentReference item) =>
      categoriaLista.remove(item);
  void removeAtIndexFromCategoriaLista(int index) =>
      categoriaLista.removeAt(index);
  void insertAtIndexInCategoriaLista(int index, DocumentReference item) =>
      categoriaLista.insert(index, item);
  void updateCategoriaListaAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      categoriaLista[index] = updateFn(categoriaLista[index]);

  String? corRegistro;

  ///  State fields for stateful widgets in this page.

  // State field(s) for imputValor widget.
  FocusNode? imputValorFocusNode;
  TextEditingController? imputValorTextController;
  String? Function(BuildContext, String?)? imputValorTextControllerValidator;
  // State field(s) for Tipo widget.
  String? tipoValue;
  FormFieldController<String>? tipoValueController;
  DateTime? datePicked;
  // State field(s) for Categoria widget.
  String? categoriaValue;
  FormFieldController<String>? categoriaValueController;
  // Stores action output result for [Custom Action - getDocRefFromID] action in Categoria widget.
  DocumentReference? docRefOutput;
  // State field(s) for descricao widget.
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoTextController;
  String? Function(BuildContext, String?)? descricaoTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RegistrosRecord? registroCriado;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    imputValorFocusNode?.dispose();
    imputValorTextController?.dispose();

    descricaoFocusNode?.dispose();
    descricaoTextController?.dispose();
  }
}
