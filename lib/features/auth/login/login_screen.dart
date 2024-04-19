import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/helpers/spacing.dart';
import 'package:task/core/theming/styles.dart';
import 'package:task/core/widgets/app_text_booton.dart';
import 'package:task/features/auth/login/cubit/login_cubit.dart';
import 'package:task/features/auth/widgets/DontHaveAccountText.dart';
import 'package:task/features/auth/widgets/email_and_password.dart';
import 'package:task/features/auth/widgets/login_bloc_listner.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //image
              Align(
                child: Container(
                  height: 85.h,
                  width: 85.h,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                    borderRadius: BorderRadius.all(Radius.elliptical(85, 85)),
                  ),
                ),
              ),
              verticalSpace(8),
              Text(
                "مرحباً بك",
                style: TextStyles.font34BlackBold,
              ),
              verticalSpace(25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(10),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'نسيت كلمة المرور',
                        style: TextStyles.font16GrayRegular,
                      ),
                    ),
                    verticalSpace(24),
                    AppGradientButton(
                      buttonText: "تسجيل الدخول",
                      textStyle: TextStyles.font20WhiteRegular,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(15),
                    const DontHaveAccountText(),
                    verticalSpace(30),
                    Text(
                      "Or Sign in With",
                      style: TextStyles.font12GrayRegular,
                    ),
                    verticalSpace(20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/facebook_auth.png",
                          ),
                        ),
                        horizontalSpace(30),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/apple_auth.png",
                          ),
                        ),
                        horizontalSpace(30),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/google_auth.png",
                          ),
                        ),
                        LoginBlocListener(),

                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
    void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
