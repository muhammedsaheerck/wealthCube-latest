part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  final int page;
  const OnboardingState(this.page);

  @override
  List<Object> get props => [page];
}
