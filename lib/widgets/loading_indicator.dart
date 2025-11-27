import 'package:flutter/material.dart';

class LoadingIndicator_QA extends StatelessWidget {
  final String? message_QA;

  const LoadingIndicator_QA({super.key, this.message_QA});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (message_QA != null) ...[
            const SizedBox(height: 16),
            Text(message_QA!),
          ],
        ],
      ),
    );
  }
}
