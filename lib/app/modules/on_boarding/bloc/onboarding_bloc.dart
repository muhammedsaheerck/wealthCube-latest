import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState(0)) {
    on<ChangeOnBoardingPageEvent>((event, emit) {
      emit(OnboardingState(state.page + 1));
    });
  }
}
