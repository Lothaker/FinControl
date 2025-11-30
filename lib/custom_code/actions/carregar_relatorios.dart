// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future carregarRelatorios(DocumentReference usuarioRef) async {
  try {
    print('📊 Carregando relatórios...');

    // Buscar todos os registros do usuário
    final registrosSnapshot = await RegistrosRecord.collection
        .where('usuario', isEqualTo: usuarioRef)
        .get();

    double totalReceitas = 0.0;
    double totalDespesas = 0.0;

    // Calcular totais
    for (var doc in registrosSnapshot.docs) {
      final registro = RegistrosRecord.fromSnapshot(doc);

      if (registro.tipo.toLowerCase() == 'receita') {
        totalReceitas += registro.valor;
      } else if (registro.tipo.toLowerCase() == 'despesa') {
        totalDespesas += registro.valor;
      }
    }

    // Calcular percentual
    double percentualGasto = 0.0;
    if (totalReceitas > 0) {
      percentualGasto = (totalDespesas / totalReceitas) * 100;
    }

    // Atualizar App State / Page State
    FFAppState().update(() {
      // Se você quiser usar App State
    });

    print('✅ Relatórios carregados:');
    print('   💰 Total Receitas: R\$ ${totalReceitas.toStringAsFixed(2)}');
    print('   💸 Total Despesas: R\$ ${totalDespesas.toStringAsFixed(2)}');
    print('   📊 Percentual Gasto: ${percentualGasto.toStringAsFixed(1)}%');
    print(
        '   💵 Saldo Atual: R\$ ${FFAppState().saldoAtual.toStringAsFixed(2)}');
  } catch (e) {
    print('❌ Erro ao carregar relatórios: $e');
  }
}
