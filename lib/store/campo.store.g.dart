// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campo.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Campo on _Campo, Store {
  late final _$abertoAtom = Atom(name: '_Campo.aberto', context: context);

  @override
  bool get aberto {
    _$abertoAtom.reportRead();
    return super.aberto;
  }

  @override
  set aberto(bool value) {
    _$abertoAtom.reportWrite(value, super.aberto, () {
      super.aberto = value;
    });
  }

  late final _$marcadoAtom = Atom(name: '_Campo.marcado', context: context);

  @override
  bool get marcado {
    _$marcadoAtom.reportRead();
    return super.marcado;
  }

  @override
  set marcado(bool value) {
    _$marcadoAtom.reportWrite(value, super.marcado, () {
      super.marcado = value;
    });
  }

  late final _$minadoAtom = Atom(name: '_Campo.minado', context: context);

  @override
  bool get minado {
    _$minadoAtom.reportRead();
    return super.minado;
  }

  @override
  set minado(bool value) {
    _$minadoAtom.reportWrite(value, super.minado, () {
      super.minado = value;
    });
  }

  late final _$explodidoAtom = Atom(name: '_Campo.explodido', context: context);

  @override
  bool get explodido {
    _$explodidoAtom.reportRead();
    return super.explodido;
  }

  @override
  set explodido(bool value) {
    _$explodidoAtom.reportWrite(value, super.explodido, () {
      super.explodido = value;
    });
  }

  late final _$_CampoActionController =
      ActionController(name: '_Campo', context: context);

  @override
  void addVizinho(Campo vizinho) {
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
aberto: ${aberto},
marcado: ${marcado},
minado: ${minado},
explodido: ${explodido}
    ''';
  }
}
