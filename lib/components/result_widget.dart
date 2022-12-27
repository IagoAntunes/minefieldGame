import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  ResultWidget({
    super.key,
    required this.venceu,
    required this.onReiniciar,
  });

  final bool venceu;
  final Function onReiniciar;

  Color _getCor() {
    if (venceu == true) {
      return Colors.green;
    } else if (venceu == false) {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }

  IconData _getIcon() {
    if (venceu == true) {
      return Icons.sentiment_satisfied;
    } else if (venceu == false) {
      return Icons.sentiment_dissatisfied;
    } else {
      return Icons.sentiment_neutral;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getCor(),
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: onReiniciar!(),
              icon: Icon(
                _getIcon(),
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(120);
}
