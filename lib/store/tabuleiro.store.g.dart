// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabuleiro.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TabuleiroStore on _Tabuleiro, Store {
  late final _$linhasAtom = Atom(name: '_Tabuleiro.linhas', context: context);

  @override
  int? get linhas {
    _$linhasAtom.reportRead();
    return super.linhas;
  }

  @override
  set linhas(int? value) {
    _$linhasAtom.reportWrite(value, super.linhas, () {
      super.linhas = value;
    });
  }

  late final _$colunasAtom = Atom(name: '_Tabuleiro.colunas', context: context);

  @override
  int? get colunas {
    _$colunasAtom.reportRead();
    return super.colunas;
  }

  @override
  set colunas(int? value) {
    _$colunasAtom.reportWrite(value, super.colunas, () {
      super.colunas = value;
    });
  }

  late final _$qtdeBombasAtom =
      Atom(name: '_Tabuleiro.qtdeBombas', context: context);

  @override
  int? get qtdeBombas {
    _$qtdeBombasAtom.reportRead();
    return super.qtdeBombas;
  }

  @override
  set qtdeBombas(int? value) {
    _$qtdeBombasAtom.reportWrite(value, super.qtdeBombas, () {
      super.qtdeBombas = value;
    });
  }

  late final _$camposAtom = Atom(name: '_Tabuleiro.campos', context: context);

  @override
  List<Campo> get campos {
    _$camposAtom.reportRead();
    return super.campos;
  }

  @override
  set campos(List<Campo> value) {
    _$camposAtom.reportWrite(value, super.campos, () {
      super.campos = value;
    });
  }

  late final _$venceuAtom = Atom(name: '_Tabuleiro.venceu', context: context);

  @override
  bool? get venceu {
    _$venceuAtom.reportRead();
    return super.venceu;
  }

  @override
  set venceu(bool? value) {
    _$venceuAtom.reportWrite(value, super.venceu, () {
      super.venceu = value;
    });
  }

  late final _$_TabuleiroActionController =
      ActionController(name: '_Tabuleiro', context: context);

  @override
  dynamic CriarTabuleiro(int colunas, int linhas, int qtdeBombas) {
    final _$actionInfo = _$_TabuleiroActionController.startAction(
        name: '_Tabuleiro.CriarTabuleiro');
    try {
      return super.CriarTabuleiro(colunas, linhas, qtdeBombas);
    } finally {
      _$_TabuleiroActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reiniciar(int linhas, int colunas, int qtdeBombas) {
    final _$actionInfo =
        _$_TabuleiroActionController.startAction(name: '_Tabuleiro.reiniciar');
    try {
      return super.reiniciar(linhas, colunas, qtdeBombas);
    } finally {
      _$_TabuleiroActionController.endAction(_$actionInfo);
    }
  }

  @override
  void revelarBombas() {
    final _$actionInfo = _$_TabuleiroActionController.startAction(
        name: '_Tabuleiro.revelarBombas');
    try {
      return super.revelarBombas();
    } finally {
      _$_TabuleiroActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _criarCampos(int linhas, int colunas, int qtdeBombas) {
    final _$actionInfo = _$_TabuleiroActionController.startAction(
        name: '_Tabuleiro._criarCampos');
    try {
      return super._criarCampos(linhas, colunas, qtdeBombas);
    } finally {
      _$_TabuleiroActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _relacionarVizinhos() {
    final _$actionInfo = _$_TabuleiroActionController.startAction(
        name: '_Tabuleiro._relacionarVizinhos');
    try {
      return super._relacionarVizinhos();
    } finally {
      _$_TabuleiroActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortearMinas() {
    final _$actionInfo = _$_TabuleiroActionController.startAction(
        name: '_Tabuleiro.sortearMinas');
    try {
      return super.sortearMinas();
    } finally {
      _$_TabuleiroActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
linhas: ${linhas},
colunas: ${colunas},
qtdeBombas: ${qtdeBombas},
campos: ${campos},
venceu: ${venceu}
    ''';
  }
}
