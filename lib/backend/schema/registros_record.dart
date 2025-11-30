import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegistrosRecord extends FirestoreRecord {
  RegistrosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "categoria" field.
  DocumentReference? _categoria;
  DocumentReference? get categoria => _categoria;
  bool hasCategoria() => _categoria != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "data_registro" field.
  DateTime? _dataRegistro;
  DateTime? get dataRegistro => _dataRegistro;
  bool hasDataRegistro() => _dataRegistro != null;

  // "obserevacao" field.
  String? _obserevacao;
  String get obserevacao => _obserevacao ?? '';
  bool hasObserevacao() => _obserevacao != null;

  // "criado_em" field.
  DateTime? _criadoEm;
  DateTime? get criadoEm => _criadoEm;
  bool hasCriadoEm() => _criadoEm != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "cor" field.
  String? _cor;
  String get cor => _cor ?? '';
  bool hasCor() => _cor != null;

  void _initializeFields() {
    _categoria = snapshotData['categoria'] as DocumentReference?;
    _tipo = snapshotData['tipo'] as String?;
    _valor = castToType<double>(snapshotData['valor']);
    _dataRegistro = snapshotData['data_registro'] as DateTime?;
    _obserevacao = snapshotData['obserevacao'] as String?;
    _criadoEm = snapshotData['criado_em'] as DateTime?;
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _cor = snapshotData['cor'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('registros');

  static Stream<RegistrosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegistrosRecord.fromSnapshot(s));

  static Future<RegistrosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RegistrosRecord.fromSnapshot(s));

  static RegistrosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegistrosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegistrosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegistrosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegistrosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegistrosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegistrosRecordData({
  DocumentReference? categoria,
  String? tipo,
  double? valor,
  DateTime? dataRegistro,
  String? obserevacao,
  DateTime? criadoEm,
  DocumentReference? usuario,
  String? cor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'categoria': categoria,
      'tipo': tipo,
      'valor': valor,
      'data_registro': dataRegistro,
      'obserevacao': obserevacao,
      'criado_em': criadoEm,
      'usuario': usuario,
      'cor': cor,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegistrosRecordDocumentEquality implements Equality<RegistrosRecord> {
  const RegistrosRecordDocumentEquality();

  @override
  bool equals(RegistrosRecord? e1, RegistrosRecord? e2) {
    return e1?.categoria == e2?.categoria &&
        e1?.tipo == e2?.tipo &&
        e1?.valor == e2?.valor &&
        e1?.dataRegistro == e2?.dataRegistro &&
        e1?.obserevacao == e2?.obserevacao &&
        e1?.criadoEm == e2?.criadoEm &&
        e1?.usuario == e2?.usuario &&
        e1?.cor == e2?.cor;
  }

  @override
  int hash(RegistrosRecord? e) => const ListEquality().hash([
        e?.categoria,
        e?.tipo,
        e?.valor,
        e?.dataRegistro,
        e?.obserevacao,
        e?.criadoEm,
        e?.usuario,
        e?.cor
      ]);

  @override
  bool isValidKey(Object? o) => o is RegistrosRecord;
}
