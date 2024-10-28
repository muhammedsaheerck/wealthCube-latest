import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wealthcube/app/helpers/extentions.dart';
import 'package:wealthcube/app/helpers/router.dart';
import 'package:wealthcube/app/helpers/sized_box.dart';
import 'package:wealthcube/app/modules/on_boarding/bloc/onboarding_bloc.dart';
import 'package:wealthcube/app/modules/widgets/common_widgets.dart';
import 'package:wealthcube/app/utils/app_constants.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.appBckgroundGreenWhite,
      body: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) => state.page,
        builder: (context, state) => Container(
          height: Responsive.hp(100),
          width: Responsive.wp(100),
          color: AppConstants.appPrimaryColor,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: Responsive.hp(60),
                  width: Responsive.wp(100),
                  decoration: const BoxDecoration(
                    color: AppConstants.appBckgroundGreenWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: Responsive.rp(20),
                            backgroundColor: AppConstants.appLightGreenColor,
                          ),
                          Image.asset(
                            fit: BoxFit.cover,
                            state.page == 0
                                ? AppConstants.onBoardOne
                                : AppConstants.onBoardTwo,
                            height: Responsive.hp(18),
                            width: Responsive.wp(42),
                          ),
                        ],
                      ),
                      SizeBoxH(Responsive.hp(4)),
                      CommonInkwell(
                        onTap: () {
                          if (state.page == 0) {
                            context
                                .read<OnboardingBloc>()
                                .add(ChangeOnBoardingPageEvent());
                          } else {
                            context.goNamed(AppRouter.login);
                          }
                        },
                        child: const CommonTextWidget(
                          text: "Next",
                          color: AppConstants.lowDarkGreen2,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizeBoxH(Responsive.hp(1.5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: state.page == 1
                                ? AppConstants.lowDarkGreen2
                                : AppConstants.appBckgroundGreenWhite,
                            child: CircleAvatar(
                              radius: state.page == 1 ? 5 : 8,
                              backgroundColor: state.page == 1
                                  ? AppConstants.appBckgroundGreenWhite
                                  : AppConstants.appPrimaryColor,
                            ),
                          ),
                          const SizeBoxV(10),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: state.page == 0
                                ? AppConstants.lowDarkGreen2
                                : AppConstants.appBckgroundGreenWhite,
                            child: CircleAvatar(
                              radius: state.page == 0 ? 5 : 8,
                              backgroundColor: state.page == 0
                                  ? AppConstants.appBckgroundGreenWhite
                                  : AppConstants.appPrimaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: Responsive.wp(15),
                right: Responsive.wp(15),
                top: Responsive.hp(18),
                child: CommonTextWidget(
                  text: state.page == 0
                      ? "Welcome to \nExpense Manager"
                      : "Are you ready to take control of your finaces?",
                  color: AppConstants.lowDarkGreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
