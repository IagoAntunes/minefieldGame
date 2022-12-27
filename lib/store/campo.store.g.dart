// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campo.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Campo on _Campo, Store {
  late final _$_abertoAtom = Atom(name: '_Campo._aberto', context: context);

  @override
  bool get _aberto {
    _$_abertoAtom.reportRead();
    return super._aberto;
  }

  @override
  set _aberto(bool value) {
    _$_abertoAtom.reportWrite(value, super._aberto, () {
      super._aberto = value;
    });
  }

  late final _$_marcadoAtom = Atom(name: '_Campo._marcado', context: context);

  @override
  bool get _marcado {
    _$_marcadoAtom.reportRead();
    return super._marcado;
  }

  @override
  set _marcado(bool value) {
    _$_marcadoAtom.reportWrite(value, super._marcado, () {
      super._marcado = value;
    });
  }

  late final _$_minadoAtom = Atom(name: '_Campo._minado', context: context);

  @override
  bool get _minado {
    _$_minadoAtom.reportRead();
    return super._minado;
  }

  @override
  set _minado(bool value) {
    _$_minadoAtom.reportWrite(value, super._minado, () {
      super._minado = value;
    });
  }

  late final _$_explodidoAtom =
      Atom(name: '_Campo._explodido', context: context);

  @override
  bool get _explodido {
    _$_explodidoAtom.reportRead();
    return super._explodido;
  }

  @override
  set _explodido(bool value) {
    _$_explodidoAtom.reportWrite(value, super._explodido, () {
      super._explodido = value;
    });
  }

  late final _$_CampoActionController =
      ActionController(name: '_Campo', context: context);

  @override
  void addVizinho(_Campo vizinho) {
    final _$actionInfo =
        _$_CampoActionController.startAction(name: '_Campo.addVizinho');
    try {
      return super.addVizinho(vizinho);
    } finally {
      _$_CampoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void abrir() {
    final _$actionInfo =
        _$_CampoActionController.startAction(name: '_Campo.abrir');
    try {
      return super.abrir();
    } finally {
      _$_CampoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void revelarBombas() {
    final _$actionInfo =
        _$_CampoActionController.startAction(name: '_Campo.revelarBombas');
    try {
      return super.revelarBombas();
    } finally {
      _$_CampoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void minar() {
    final _$actionInfo =
        _$_CampoActionController.startAction(name: '_Campo.minar');
    try {
      return super.minar();
    } finally {
      _$_CampoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alternarMarcacao() {
    final _$actionInfo =
        _$_CampoActionController.startAction(name: '_Campo.alternarMarcacao');
    try {
      return super.alternarMarcacao();
    } finally {
      _$_CampoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reiniciar() {
    final _$actionInfo =
        _$_CampoActionController.startAction(name: '_Campo.reiniciar');
    try {
      return super.reiniciar();
    } finally {
      _$_CampoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
