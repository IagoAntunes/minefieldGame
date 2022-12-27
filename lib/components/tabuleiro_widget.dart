import 'package:campominado/components/campo_widget.dart';
import 'package:campominado/models/tabuleiro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/campo.dart';

class TabuleiroWidget extends StatelessWidget {
  TabuleiroWidget({
    super.key,
    required this.onAbrir,
    required this.onAlternarMarcacao,
    required this.tabuleiro,
  });

  final Tabuleiro tabuleiro;
  void Function(Campo) onAbrir;
  void Function(Campo) onAlternarMarcacao;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map(
          (e) {
            return CampoWidget(
              campo: e,
              onAbrir: onAbrir,
              onAlternarMarcacao: onAlternarMarcacao,
            );
          },
        ).toList(),
      ),
    );
  }
}