import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wealthcube/app/helpers/extentions.dart';
import 'package:wealthcube/app/utils/app_constants.dart';

import '../../../../helpers/router.dart';
import '../../../widgets/common_widgets.dart';

class PasswordChangedSuccessScreen extends StatelessWidget {
  const PasswordChangedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.appPrimaryColor,
        body: SizedBox(
          width: Responsive.wp(100),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppConstants.checkProgress,
                  height: Responsive.wp(30),
                ),
                SizedBox(
                  height: Responsive.hp(3),
                ),
                const CommonTextWidget(
                  text: "Password Has been\n Changed successfully",
                  color: AppConstants.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: Responsive.hp(3),
                ),
                CommonButton(
                  height: 40,
                  bgColor: AppConstants.appLightGreenColor.withOpacity(.8),
                  borderRadius: BorderRadius.circular(50),
                  text: "Go to Login",
                  ontap: () {
                    context.goNamed(AppRouter.login);
                  },
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  width: Responsive.wp(38),
                ),
              ]),
        ));
  }
}
