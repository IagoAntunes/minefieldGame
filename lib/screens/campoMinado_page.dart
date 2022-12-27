import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CampoMinadoPage extends StatelessWidget {
  const CampoMinadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Campo Minado'),
        ),
        body: Container(
          child: Text('oLA'),
        ),
      ),
    );
  }
}
