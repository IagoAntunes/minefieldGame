import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/campo.store.dart';

class CampoWidget extends StatelessWidget {
  CampoWidget({
    super.key,
    required this.campo,
    required this.onAbrir,
    required this.onAlternarMarcacao,
  });

  final Campo campo;
  void Function(Campo) onAbrir;
  void Function(Campo) onAlternarMarcacao;

  String _getImage() {
    int qtdeMinas = campo.qtdMinasVizinhanca;
    if (campo.aberto && campo.minado && campo.explodido) {
      campo.image = 'assets/images/bomba_0.jpeg';
      return campo.image;
    } else if (campo.aberto && campo.minado) {
      campo.image = 'assets/images/bomba_1.jpeg';
      return campo.image;
    } else if (campo.aberto) {
      campo.image = 'assets/images/aberto_$qtdeMinas.jpeg';
      return campo.image;
    } else if (campo.marcado) {
      campo.image = 'assets/images/bandeira.jpeg';
      return campo.image;
    } else {
      campo.image = 'assets/images/fechado.jpeg';
      return campo.image;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: Observer(builder: (context) => Image.asset(_getImage())),
    );
  }
}
