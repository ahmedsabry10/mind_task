import 'package:flutter/material.dart';
import 'package:task/core/theming/styles.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                  Text(
                    'FavouriteScreen',
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