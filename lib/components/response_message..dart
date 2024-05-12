import 'package:flutter/material.dart';

class ResponseMessage extends StatelessWidget {
  final String? message;

  const ResponseMessage({
     this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Text(
          message??"",
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
