import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'relatorios_widget.dart' show RelatoriosWidget;
import 'package:flutter/material.dart';

class RelatoriosModel extends FlutterFlowModel<RelatoriosWidget> {
  ///  Local state fields for this page.

  double totalReceitas = 0.0;

  double totalDespesas = 0.0;

  double percentualGasto = 0.0;

  double saldoTotal = 0.0;

  List<DocumentReference> registroUsuario = [];
  void addToRegistroUsuario(DocumentReference item) =>
      registroUsuario.add(item);
  void removeFromRegistroUsuario(DocumentReference item) =>
      registroUsuario.remove(item);
  void removeAtIndexFromRegistroUsuario(int index) =>
      registroUsuario.removeAt(index);
  void insertAtIndexInRegistroUsuario(int index, DocumentReference item) =>
      registroUsuario.insert(index, item);
  void updateRegistroUsuarioAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      registroUsuario[index] = updateFn(registroUsuario[index]);

  List<double> grafico = [];
  void addToGrafico(double item) => grafico.add(item);
  void removeFromGrafico(double item) => grafico.remove(item);
  void removeAtIndexFromGrafico(int index) => grafico.removeAt(index);
  void insertAtIndexInGrafico(int index, double item) =>
      grafico.insert(index, item);
  void updateGraficoAtIndex(int index, Function(double) updateFn) =>
      grafico[index] = updateFn(grafico[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Relatorios widget.
  List<RegistrosRecord>? querryregistro;
  // Stores action output result for [Firestore Query - Query a collection] action in Relatorios widget.
  List<CategoriasRecord>? querryCategorias;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
