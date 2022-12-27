import 'package:campominado/components/result_widget.dart';
import 'package:campominado/components/tabuleiro_widget.dart';
import 'package:campominado/store/tabuleiro.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:campominado/components/campo_widget.dart';
import 'package:campominado/store/campo.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CampoMinadoPage extends StatefulWidget {
  const CampoMinadoPage({super.key});

  @override
  State<CampoMinadoPage> createState() => _CampoMinadoPageState();
}

class _CampoMinadoPageState extends State<CampoMinadoPage> {
  final store = TabuleiroStore();

  @override
  void initState() {
    store.CriarTabuleiro(5, 5, 2);
    super.initState();
  }

  void _reiniciar() {
    store.venceu = null;
    store.reiniciar(5, 5, 2);
  }

  void _abrir(Campo campo) {
    if (store.venceu != null) return;
    try {
      campo.abrir();
      if (store.resolvido) {
        store.venceu = true;
      }
    } catch (e) {
      store.venceu = false;
      store.revelarBombas();
    }
  }

  void _alternarMarcacao(Campo campo) {
    if (store.venceu != null) return;

    campo.alternarMarcacao();
    if (store.resolvido) {
      store.venceu = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Campo campo = Campo(linha: 0, coluna: 0);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            child: Observer(
              builder: (context) => ResultWidget(
                venceu: store.venceu,
                onReiniciar: () => print('teste'),
              ),
            ),
          ),
          Expanded(
            child: Container(
                child: LayoutBuilder(
              builder: (ctx, constraints) => TabuleiroWidget(
                onAbrir: _abrir,
                onAlternarMarcacao: _alternarMarcacao,
                store: store,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
