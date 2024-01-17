import 'package:flutter/material.dart';

class SosDetailPage extends StatelessWidget {
  const SosDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SOS Status',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: const Center(child: Text('(SOS Detail)')),
    );
  }
}
