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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<double> atualizarSaldoCompleto(
  DocumentReference usuarioRef,
  double valor,
  String tipo,
) async {
  try {
    // Pegar saldo atual do App State (mais rápido)
    double saldoAtual = FFAppState().saldoAtual;

    // Se App State estiver zerado, buscar do Firestore
    if (saldoAtual == 0.0) {
      final usuarioSnap = await usuarioRef.get();
      saldoAtual = (usuarioSnap.get('saldo') as num?)?.toDouble() ?? 0.0;
    }

    // Calcular novo saldo
    double novoSaldo;
    if (tipo.toLowerCase() == 'receita') {
      novoSaldo = saldoAtual + valor;
      print('💰 Receita: +R\$ $valor');
    } else {
      novoSaldo = saldoAtual - valor;
      print('💸 Despesa: -R\$ $valor');
    }

    // Atualizar no Firestore (persistente)
    await usuarioRef.update({'saldo': novoSaldo});

    // Atualizar no App State (em memória - UI atualiza instantaneamente)
    FFAppState().update(() {
      FFAppState().saldoAtual = novoSaldo;
    });

    print('✅ Saldo atualizado: R\$ ${novoSaldo.toStringAsFixed(2)}');
    print('   • Firestore: atualizado');
    print('   • App State: atualizado');
    print('   • UI: atualizada automaticamente');

    return novoSaldo;
  } catch (e) {
    print('❌ Erro ao atualizar saldo: $e');
    return 0.0;
  }
}
