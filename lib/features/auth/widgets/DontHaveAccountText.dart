import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task/core/helpers/extensitions.dart';
import 'package:task/core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'ليس لديك حساب؟',
            style: TextStyles.font16GrayRegular,
          ),
          TextSpan(
            text: 'سجل الآن',
            style: TextStyles.font18GreenAccentRegular,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.registerScreen);
              },
          ),
        ],
      ),
    );
  }
}
