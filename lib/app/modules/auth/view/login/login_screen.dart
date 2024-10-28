import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wealthcube/app/helpers/router.dart';
import 'package:wealthcube/app/helpers/sized_box.dart';
import 'package:wealthcube/app/utils/app_constants.dart';

import '../../../../helpers/extentions.dart';
import '../../../widgets/common_widgets.dart';
import '../../cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: Responsive.hp(100),
        width: Responsive.wp(100),
        color: AppConstants.appPrimaryColor,
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: Responsive.hp(10)),
                child: const CommonTextWidget(
                  text: "Welcome",
                  color: AppConstants.lowDarkGreen,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.all(Responsive.wp(8)),
                height: Responsive.hp(80),
                width: Responsive.wp(100),
                decoration: const BoxDecoration(
                  color: AppConstants.appBckgroundGreenWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizeBoxH(Responsive.hp(5)),
                      const TextFieldLabelWidget(
                        labelText: "Uername Or Email",
                      ),
                      CommonTextFormField(
                          textInputAction: TextInputAction.next,
                          hintText: "example@example.com",
                          keyboardType: TextInputType.emailAddress,
                          controller: state.emailController),
                      SizedBox(
                        height: Responsive.hp(2),
                      ),
                      const TextFieldLabelWidget(
                        labelText: "Password",
                      ),
                      CommonTextFormField(
                        textInputAction: TextInputAction.done,
                        hintText: "Password",
                        obscureText: state.isObsecurePassword,
                        keyboardType: TextInputType.emailAddress,
                        controller: state.passwordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            context
                                .read<AuthCubit>()
                                .changePasswordVisibility();
                          },
                          icon: state.isObsecurePassword
                              ? Image.asset(
                                  AppConstants.visibilityOffIcon,
                                  height: 9,
                                  width: 25,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.visibility_outlined,
                                  size: 22,
                                  color: AppConstants.lowDarkGreen2,
                                ),
                        ),
                      ),
                      SizeBoxH(Responsive.hp(7)),
                      CommonButton(
                        height: 42,
                        borderRadius: BorderRadius.circular(50),
                        text: "Log In",
                        ontap: () {},
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        width: Responsive.wp(40),
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushNamed(AppRouter.forgotPassword);
                        },
                        child: CommonTextWidget(
                          text: "Forgot Password?",
                          fontSize: Responsive.sp(8),
                          fontWeight: FontWeight.w600,
                          color: AppConstants.appLettersAndIconsColor,
                        ),
                      ),
                      CommonButton(
                        height: 42,
                        bgColor: AppConstants.appLightGreenColor,
                        borderRadius: BorderRadius.circular(50),
                        text: "Sign Up",
                        ontap: () {
                          context.pushNamed(AppRouter.register);
                        },
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        width: Responsive.wp(40),
                      ),
                      SizeBoxH(Responsive.hp(2.5)),
                      CommonTextWidget(
                        text: "Or Sign Up With",
                        fontSize: Responsive.sp(8),
                      ),
                      SizeBoxH(Responsive.hp(3)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppConstants.facebook,
                            height: 32,
                            width: 32,
                          ),
                          SizeBoxV(Responsive.wp(4)),
                          Image.asset(
                            AppConstants.googleIcon,
                            height: 32,
                            width: 32,
                          ),
                        ],
                      ),
                      SizeBoxH(Responsive.hp(3)),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text: "Don’t have an account? ",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(AppRouter.register);
                              },
                            text: "  Sign Up",
                            style: const TextStyle(
                                color: AppConstants.appBlueColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ]))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldLabelWidget extends StatelessWidget {
  final String? labelText;
  const TextFieldLabelWidget({
    super.key,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, bottom: 8),
        child: CommonTextWidget(
          text: labelText ?? "",
          align: TextAlign.start,
          color: AppConstants.appLettersAndIconsColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
