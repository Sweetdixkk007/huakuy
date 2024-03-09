import 'package:flutter/material.dart';
import 'package:jobspot/Screens/AddPost.dart';
import 'package:page_transition/page_transition.dart';

class Ecom extends StatelessWidget {
  const Ecom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ร้านทั้งหมด',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: AddPost()));
            },
            child: const Text(
              'Post',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
        ],
      ),
    );
  }
}
