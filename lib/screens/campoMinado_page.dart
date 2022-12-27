import 'package:campominado/components/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CampoMinadoPage extends StatelessWidget {
  const CampoMinadoPage({super.key});

  void _Reiniciar() {
    print('....');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          venceu: true,
          onReiniciar: _Reiniciar,
        ),
        body: Container(
          child: Text('oLA'),
        ),
      ),
    );
  }
}
