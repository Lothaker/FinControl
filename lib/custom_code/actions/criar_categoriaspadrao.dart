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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

Future criarCategoriaspadrao(String usuarioUid) async {
  final firestore = FirebaseFirestore.instance;

  // Verifica se já existem categorias para este usuário
  final categoriasExistentes = await firestore
      .collection('categorias')
      .where('usuario_uid', isEqualTo: usuarioUid)
      .limit(1)
      .get();

  // Se já existe, não cria novamente
  if (categoriasExistentes.docs.isNotEmpty) {
    print('⚠️ Usuário já possui categorias. Não criando duplicatas.');
    return;
  }

  // Lista de categorias padrão
  final categorias = [
    'Alimentação',
    'Transporte',
    'Lazer',
    'Contas',
    'Salário',
    'Aluguel',
    'Renda Extra'
  ];

  // Criar cada categoria usando o NOME como ID do documento
  for (var nome in categorias) {
    // Remove espaços e acentos para criar um ID válido
    String docId = nome
        .replaceAll(' ', '_')
        .replaceAll('ã', 'a')
        .replaceAll('á', 'a')
        .replaceAll('â', 'a')
        .replaceAll('é', 'e')
        .replaceAll('ê', 'e')
        .replaceAll('í', 'i')
        .replaceAll('ó', 'o')
        .replaceAll('ô', 'o')
        .replaceAll('ú', 'u')
        .toLowerCase();

    // Usa doc() com ID específico em vez de add()
    await firestore.collection('categorias').doc(docId).set({
      'nome': nome,
      'tipo': '',
      'usuario_uid': usuarioUid,
    });
  }

  print('✅ ${categorias.length} categorias criadas com IDs personalizados!');
}
