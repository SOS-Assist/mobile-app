import 'package:flutter/material.dart';

class OngoingSos extends StatefulWidget {
  const OngoingSos({super.key});

  @override
  State<OngoingSos> createState() => _OngoingSosState();
}

class _OngoingSosState extends State<OngoingSos> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: screenWidth,
        color: colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'SOS Sent!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Go Back'),
            )
          ],
        ),
      ),
    );

    // return Scaffold(
    //   body: Center(
    //     child: Container(
    //       color: colorScheme.primary,
    //       child: Column(
    //         children: [
    //           const Text('SOS Sent!'),
    //           TextButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             child: const Text(
    //               'Go Back',
    //               style: TextStyle(color: Colors.white),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
