import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wealthcube/app/modules/on_boarding/bloc/onboarding_bloc.dart';

import '../modules/auth/cubit/auth_cubit.dart';

final List<BlocProvider> providers = [
  BlocProvider<OnboardingBloc>(
    create: (context) => OnboardingBloc(),
  ),
  BlocProvider<AuthCubit>(
    create: (context) => AuthCubit(),
  ),
];
