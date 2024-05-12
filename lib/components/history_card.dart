import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String question;
  final String response;
  final bool isFavorite;
  final Function() onFavoriteTapped;

  const HistoryCard({
    required this.question,
    required this.response,
    required this.isFavorite,
    required this.onFavoriteTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Question:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(question),
                const SizedBox(height: 10.0),
                const Text(
                  'Response:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(response),
              ],
            ),
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: onFavoriteTapped,
                icon: isFavorite
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_outline),
              ),
            )
          ],
        ),
      ),
    );
  }
}
