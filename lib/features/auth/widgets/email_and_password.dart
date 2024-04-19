import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/features/auth/login/cubit/login_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../core/helpers/app_regs.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  // late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    //passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    // passwordController.addListener(() {
    //   setState(() {
    //     hasLowercase = AppRegex.hasLowerCase(passwordController.text);
    //     hasUppercase = AppRegex.hasUpperCase(passwordController.text);
    //     hasSpecialCharacters =
    //         AppRegex.hasSpecialCharacter(passwordController.text);
    //     hasNumber = AppRegex.hasNumber(passwordController.text);
    //     hasMinLength = AppRegex.hasMinLength(passwordController.text);
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            prefixIcon:const Icon(
              IconlyLight.message,
              color: ColorsManager.mainYellow,
              size: 30,
            ),
            hintText: 'البريد الالكتروني',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'من فضلك قم بادخال البريد الالكتروني';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            prefixIcon:const Icon(
              IconlyLight.lock,
              color: ColorsManager.mainYellow,
              size: 30,
            ),
            hintText: 'الرقم السري',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'من فضلك قم بادخال الرقم السري';
              }
            },
          ),
          verticalSpace(24),
        
        ],
      ),
    );
  }


}
