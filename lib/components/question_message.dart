import 'package:flutter/material.dart';

class QuestionMessage extends StatelessWidget {
  final String? question;

  const QuestionMessage({
    this.question,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Text(
          question ?? "",
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
