import 'package:campominado/components/result_widget.dart';
import 'package:campominado/components/tabuleiro_widget.dart';
import 'package:campominado/models/tabuleiro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:campominado/components/campo_widget.dart';
import 'package:campominado/models/campo.dart';

class CampoMinadoPage extends StatefulWidget {
  const CampoMinadoPage({super.key});

  @override
  State<CampoMinadoPage> createState() => _CampoMinadoPageState();
}

class _CampoMinadoPageState extends State<CampoMinadoPage> {
  bool? _venceu = false;
  Tabuleiro? tabuleiro;

  void _reiniciar() {
    setState(() {
      tabuleiro!.reiniciar();
      _venceu = null;
    });
  }

  void _abrir(Campo campo) {
    if (_venceu != null) return;
    setState(() {
      try {
        if (tabuleiro!.resolvido) {
          _venceu = true;
        }
      } catch (e) {
        _venceu = false;
        tabuleiro!.revelarBombas();
      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    if (_venceu != null) return;
    setState(
      () {
        campo.alternarMarcacao();
        if (tabuleiro!.resolvido) {
          _venceu = true;
        }
      },
    );
  }

  Tabuleiro getTabuleiro(double largura, double altura) {
    if (tabuleiro == null) {
      int qtdColunas = 15;
      double tamanhoCampo = largura / qtdColunas;
      int qtdLinhas = (altura / tamanhoCampo).floor();
      tabuleiro =
          Tabuleiro(linhas: qtdLinhas, colunas: qtdColunas, qtdeBombas: 3);
    }
    return tabuleiro!;
  }

  @override
  Widget build(BuildContext context) {
    Campo campo = Campo(linha: 0, coluna: 0);
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          venceu: _venceu,
          onReiniciar: _reiniciar,
        ),
        body: Container(
            child: LayoutBuilder(
          builder: (ctx, constraints) => TabuleiroWidget(
            tabuleiro:
                getTabuleiro(constraints.maxWidth, constraints.maxHeight),
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        )),
      ),
    );
  }
}
