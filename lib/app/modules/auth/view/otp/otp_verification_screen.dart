import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:wealthcube/app/helpers/router.dart';
import 'package:wealthcube/app/helpers/sized_box.dart';
import 'package:wealthcube/app/utils/app_constants.dart';

import '../../../../helpers/extentions.dart';
import '../../../widgets/common_widgets.dart';
import '../../cubit/auth_cubit.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

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
                  text: "Security pin",
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizeBoxH(Responsive.hp(5)),
                    const CommonTextWidget(
                      text: "Enter security pin",
                      color: AppConstants.lowDarkGreen,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    SizeBoxH(Responsive.hp(7)),
                    Pinput(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      length: 6,
                      focusedPinTheme: PinTheme(
                        textStyle: const TextStyle(
                            color: AppConstants.darkGreen, fontSize: 20),
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppConstants.appPrimaryColor.withOpacity(0.1),
                          border: Border.all(
                            color: AppConstants.appPrimaryColor.withOpacity(.4),
                          ),
                        ),
                      ),
                      defaultPinTheme: PinTheme(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: AppConstants.appBckgroundGreenWhite,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 2,
                              color: AppConstants.appPrimaryColor,
                            )),
                      ),
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) {
                        // context
                        //     .read<ViveraAuthProvider>()
                        //     .otpVerificationController = pin;
                      },
                      errorPinTheme: PinTheme(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppConstants.appRed.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: AppConstants.appRed.withOpacity(.4),
                          ),
                        ),
                      ),
                      errorText: 'Entered pin is incorrect',
                      errorTextStyle: const TextStyle(
                        color: AppConstants.appRed,
                        fontSize: 12,
                      ),
                      onTapOutside: (_) {
                        FocusScope.of(context).unfocus();
                      },
                      pinAnimationType: PinAnimationType.fade,
                      submittedPinTheme: PinTheme(
                        textStyle: const TextStyle(
                            color: AppConstants.darkGreen, fontSize: 20),
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: AppConstants.appLightGreenColor,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 2,
                            color: AppConstants.appPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizeBoxH(Responsive.hp(7)),
                    CommonButton(
                      height: 42,
                      borderRadius: BorderRadius.circular(50),
                      text: "Accept",
                      ontap: () {
                        context.pushNamed(AppRouter.createNewPasswordScreen);
                      },
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      width: Responsive.wp(40),
                    ),
                    SizeBoxH(Responsive.hp(2)),
                    CommonButton(
                      height: 42,
                      bgColor: AppConstants.appLightGreenColor,
                      borderRadius: BorderRadius.circular(50),
                      text: "Send Again",
                      ontap: () {
                        context.pushNamed(AppRouter.register);
                      },
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      width: Responsive.wp(40),
                    ),
                    const Spacer(),
                    CommonTextWidget(
                      text: "Or Sign Up With",
                      fontSize: Responsive.sp(8),
                    ),
                    SizeBoxH(Responsive.hp(2)),
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
                    SizeBoxH(Responsive.hp(2)),
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
            ],
          ),
        ),
      ),
    );
  }
}
