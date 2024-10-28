import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wealthcube/app/helpers/sized_box.dart';
import 'package:wealthcube/app/utils/app_constants.dart';

import '../../../../helpers/extentions.dart';
import '../../../widgets/common_widgets.dart';
import '../../cubit/auth_cubit.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                  text: "Create Account",
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
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const TextFieldLabelWidget(
                          labelText: "Full Name",
                        ),
                        CommonTextFormField(
                            textInputAction: TextInputAction.next,
                            hintText: "example name",
                            keyboardType: TextInputType.emailAddress,
                            controller: state.emailController),
                        SizedBox(
                          height: Responsive.hp(1.5),
                        ),
                        const TextFieldLabelWidget(
                          labelText: "Email",
                        ),
                        CommonTextFormField(
                            textInputAction: TextInputAction.next,
                            hintText: "example@gmail.com",
                            keyboardType: TextInputType.emailAddress,
                            controller: state.emailController),
                        SizedBox(
                          height: Responsive.hp(1.5),
                        ),
                        const TextFieldLabelWidget(
                          labelText: "Mobile Number",
                        ),
                        CommonTextFormField(
                            textInputAction: TextInputAction.next,
                            hintText: "+ 123 456 789",
                            keyboardType: TextInputType.emailAddress,
                            controller: state.emailController),
                        SizedBox(
                          height: Responsive.hp(1.5),
                        ),
                        const TextFieldLabelWidget(
                          labelText: "Date of Birth",
                        ),
                        CommonTextFormField(
                            textInputAction: TextInputAction.next,
                            hintText: "DD / MM /YYY",
                            keyboardType: TextInputType.emailAddress,
                            controller: state.emailController),
                        SizedBox(
                          height: Responsive.hp(1.5),
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
                        SizedBox(
                          height: Responsive.hp(1.5),
                        ),
                        const TextFieldLabelWidget(
                          labelText: "Confirm Password",
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
                        SizeBoxH(Responsive.hp(4)),
                        const Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(children: [
                              TextSpan(
                                  text: "By continuing, you agree to \n ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "Terms of Use ",
                                  style: TextStyle(
                                      color: AppConstants.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: "and ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                      color: AppConstants.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                            ])),
                        SizeBoxH(Responsive.hp(1.5)),
                        CommonButton(
                          height: 42,
                          borderRadius: BorderRadius.circular(50),
                          text: "Sign Up",
                          ontap: () {},
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          width: Responsive.wp(42),
                        ),
                        SizeBoxH(Responsive.hp(1.8)),
                        Text.rich(TextSpan(children: [
                          const TextSpan(
                              text: "Already have an account?",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400)),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.pop();
                                },
                              text: "  Log In",
                              style: const TextStyle(
                                  color: AppConstants.appBlueColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500)),
                        ]))
                      ],
                    ),
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
