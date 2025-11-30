import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime dataOntem() {
  return DateTime.now().subtract(Duration(days: 1));
}

double? calcularTodaReceitas(List<RegistrosRecord> registros) {
  double total = 0.0;

  for (var registro in registros) {
    if (registro.tipo?.toLowerCase() == 'receita') {
      total += registro.valor ?? 0.0;
    }
  }

  return total;
}

double? calcularTodasDespesas(List<RegistrosRecord> registros) {
  double total = 0.0;

  for (var registro in registros) {
    if (registro.tipo?.toLowerCase() == 'despesa') {
      total += registro.valor ?? 0.0;
    }
  }

  return total;
}

double? calcularPercentualGasto(
  double despesas,
  double receitas,
) {
  if (receitas == 0) {
    return 0.0;
  }

  return (despesas / receitas) * 100;
}

double calcularTotalPorCategoria(
  List<RegistrosRecord>? registros,
  DocumentReference? categoriaRef,
) {
  if (registros == null || registros.isEmpty) {
    return 0.0;
  }

  if (categoriaRef == null) {
    return 0.0;
  }

  double total = 0.0;

  for (var registro in registros) {
    if (registro.categoria != null &&
        registro.categoria!.path == categoriaRef.path) {
      total += registro.valor ?? 0.0;
    }
  }

  return total;
}
