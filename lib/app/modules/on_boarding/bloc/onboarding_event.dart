part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeOnBoardingPageEvent extends OnboardingEvent {}
