import 'package:flutter/material.dart';
import 'package:task/core/theming/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                  Text(
                    'ProfileScreen',
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