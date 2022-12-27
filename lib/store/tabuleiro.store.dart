import 'dart:math';

import 'package:mobx/mobx.dart';

import 'campo.store.dart';
part 'tabuleiro.store.g.dart';

class TabuleiroStore = _Tabuleiro with _$TabuleiroStore;

abstract class _Tabuleiro with Store {
  @observable
  int? linhas;
  @observable
  int? colunas;
  @observable
  int? qtdeBombas;
  @observable
  List<Campo> campos = [];
  @observable
  bool? venceu;

  @action
  CriarTabuleiro(int colunas, int linhas, int qtdeBombas) {
    this.colunas = colunas;
    this.linhas = linhas;
    this.qtdeBombas = qtdeBombas;
    _criarCampos(colunas, linhas, qtdeBombas);
    _relacionarVizinhos();
    sortearMinas();
  }

  @action
  void reiniciar(int linhas, int colunas, int qtdeBombas) {
    campos.forEach(
      (element) {
        element.reiniciar();
      },
    );
    sortearMinas();
  }

  @action
  void revelarBombas() {
    campos.forEach((element) {
      element.revelarBombas();
    });
  }

  @action
  void _criarCampos(int linhas, int colunas, int qtdeBombas) {
    for (var l = 0; l < linhas; l++) {
      for (var c = 0; c < colunas; c++) {
        campos.add(Campo(linha: l, coluna: c));
      }
    }
    print(campos.length);
  }

  @action
  void _relacionarVizinhos() {
    for (var campo in campos) {
      for (var vizinho in campos) {
        campo.addVizinho(vizinho);
      }
    }
  }

  @action
  void sortearMinas() {
    int sorteadas = 0;

    if (qtdeBombas! > (linhas! * colunas!)) {
      return;
    }

    while (sorteadas < qtdeBombas!) {
      int i = Random().nextInt(campos.length);
      if (!campos[i].minado) {
        sorteadas++;
        campos[i].minar();
      }
    }
  }

  bool get resolvido {
    return campos.every((element) => element.resolvido);
  }
}
