import 'package:mobx/mobx.dart';

part 'campo.store.g.dart';

class Campo = _Campo with _$Campo;

abstract class _Campo with Store {
  final int linha;
  final int coluna;
  final List<_Campo> vizinhos = [];

  @observable
  bool _aberto = false;
  @observable
  bool _marcado = false;
  @observable
  bool _minado = false;
  @observable
  bool _explodido = false;

  _Campo({
    required this.linha,
    required this.coluna,
  });

  @action
  void addVizinho(_Campo vizinho) {
    final deltaLinha = (this.linha - vizinho.linha).abs();
    final deltaColuna = (this.coluna - vizinho.coluna).abs();

    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    } else if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  @action
  void abrir() {
    if (_aberto) {
      return;
    }

    _aberto = true;

    if (_minado) {
      _explodido = true;
      throw Exception();
    }

    if (vizinhancaSegura) {
      for (var v in vizinhos) {
        v.abrir();
      }
    }
  }

  @action
  void revelarBombas() {
    if (_minado) {
      _aberto = true;
    }
  }

  @action
  void minar() {
    _minado = true;
  }

  @action
  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  @action
  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }

  bool get resolvido {
    bool minadoEmarcado = _minado && _marcado;
    bool seguroEAberto = !minado && _aberto;
    return minadoEmarcado || seguroEAberto;
  }

  bool get vizinhancaSegura {
    return vizinhos.every((element) => element._minado == false);
  }

  int get qtdMinasVizinhanca {
    return vizinhos.where((element) => element.minado).length;
  }
}
