import 'package:campominado/components/campo_widget.dart';
import 'package:campominado/store/tabuleiro.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/campo.store.dart';

class TabuleiroWidget extends StatelessWidget {
  TabuleiroWidget({
    super.key,
    required this.onAbrir,
    required this.onAlternarMarcacao,
    required this.store,
  });

  void Function(Campo) onAbrir;
  void Function(Campo) onAlternarMarcacao;
  TabuleiroStore store;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: store.colunas!,
      children: store.campos.map(
        (e) {
          return Observer(
            builder: (context) => CampoWidget(
              campo: e,
              onAbrir: onAbrir,
              onAlternarMarcacao: onAlternarMarcacao,
            ),
          );
        },
      ).toList(),
    );
  }
}
