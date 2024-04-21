import 'package:flutter/material.dart';
import 'package:task/core/theming/styles.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                  Text(
                    'ListScreen',
                    style: TextStyles.font15BlackBold
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}