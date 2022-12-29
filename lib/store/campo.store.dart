import 'package:mobx/mobx.dart';

part 'campo.store.g.dart';

class Campo = _Campo with _$Campo;

abstract class _Campo with Store {
  final int linha;
  final int coluna;
  final List<_Campo> vizinhos = [];

  @observable
  bool aberto = false;
  @observable
  bool marcado = false;
  @observable
  bool minado = false;
  @observable
  bool explodido = false;
  @observable
  String image = "";

  _Campo({
    required this.linha,
    required this.coluna,
  });

  @action
  void addVizinho(Campo vizinho) {
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
    if (aberto) {
      return;
    }

    aberto = true;

    if (minado) {
      explodido = true;
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
    if (minado) {
      aberto = true;
    }
  }

  @action
  void minar() {
    minado = true;
  }

  @action
  void alternarMarcacao() {
    marcado = !marcado;
  }

  @action
  void reiniciar() {
    aberto = false;
    marcado = false;
    minado = false;
    explodido = false;
  }

  bool get resolvido {
    bool minadoEmarcado = minado && marcado;
    bool seguroEAberto = !minado && aberto;
    return minadoEmarcado || seguroEAberto;
  }

  bool get vizinhancaSegura {
    return vizinhos.every((element) => element.minado == false);
  }

  int get qtdMinasVizinhanca {
    return vizinhos.where((element) => element.minado).length;
  }
}
