import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GenericPage extends StatelessWidget {
  final String titleText;
  final String destination;
  const GenericPage(
      {super.key, required this.titleText, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titleText)),
      body: Center(
        child: FilledButton(
          child: Text(destination),
          onPressed: () {
            context.goNamed(destination);
          },
        ),
      ),
    );
  }
}
