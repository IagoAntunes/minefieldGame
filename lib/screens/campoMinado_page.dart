import 'dart:math';

import 'package:campominado/components/result_widget.dart';
import 'package:campominado/components/tabuleiro_widget.dart';
import 'package:campominado/store/tabuleiro.store.dart';
import 'package:flutter/material.dart';
import 'package:campominado/store/campo.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:confetti/confetti.dart';

class CampoMinadoPage extends StatefulWidget {
  const CampoMinadoPage({super.key});

  @override
  State<CampoMinadoPage> createState() => _CampoMinadoPageState();
}

class _CampoMinadoPageState extends State<CampoMinadoPage> {
  final store = TabuleiroStore();
  bool caboBuild = false;
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    store.CriarTabuleiro(5, 5, 2);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // do something
      setState(() {
        caboBuild = true;
      });
    });
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));

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
        Future.delayed(Duration(seconds: 5)).then((value) => _reiniciar());
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
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100,
            child: Observer(
              builder: (context) => ResultWidget(
                venceu: store.venceu,
                onReiniciar: () => null,
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (ctx, constraints) => TabuleiroWidget(
                onAbrir: _abrir,
                onAlternarMarcacao: _alternarMarcacao,
                store: store,
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              //CENTER -- Blast
              Align(
                alignment: Alignment.center,
                child: ConfettiWidget(
                  confettiController: _controllerCenter,
                  blastDirectionality: BlastDirectionality
                      .explosive, // don't specify a direction, blast randomly
                  shouldLoop:
                      true, // start again as soon as the animation is finished
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ], // manually specify the colors to be used
                  createParticlePath: drawStar, // define a custom shape/path.
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      _controllerCenter.play();
                    },
                    child: _display('blast\nstars')),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Text _display(String text) {
  return Text(
    'ALO',
    style: const TextStyle(color: Colors.black, fontSize: 20),
  );
}
