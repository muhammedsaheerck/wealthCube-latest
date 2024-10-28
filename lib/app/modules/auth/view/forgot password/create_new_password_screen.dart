import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wealthcube/app/helpers/router.dart';
import 'package:wealthcube/app/helpers/sized_box.dart';
import 'package:wealthcube/app/utils/app_constants.dart';

import '../../../../helpers/extentions.dart';
import '../../../widgets/common_widgets.dart';
import '../../cubit/auth_cubit.dart';
import '../login/login_screen.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

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
                  text: "New password",
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
                        labelText: "New Password",
                      ),
                      CommonTextFormField(
                        textInputAction: TextInputAction.done,
                        hintText: "New Password",
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
                        height: Responsive.hp(2),
                      ),
                      const TextFieldLabelWidget(
                        labelText: "Confirm Password",
                      ),
                      CommonTextFormField(
                        textInputAction: TextInputAction.done,
                        hintText: "Confirm Password",
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
                      const Spacer(),
                      CommonButton(
                        height: 42,
                        borderRadius: BorderRadius.circular(50),
                        text: "Change Password",
                        ontap: () {
                          context
                              .goNamed(AppRouter.passwordChangedSuccessScreen);
                        },
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        width: Responsive.wp(100),
                      ),
                      SizeBoxH(Responsive.hp(20)),
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
