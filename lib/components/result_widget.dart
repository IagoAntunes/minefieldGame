import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  const ResultWidget({
    super.key,
    required this.venceu,
    required this.onReiniciar,
  });

  final bool? venceu;
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
      decoration: const BoxDecoration(color: Colors.grey),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getCor(),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: onReiniciar(),
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
  Size get preferredSize => const Size.fromHeight(120);
}
