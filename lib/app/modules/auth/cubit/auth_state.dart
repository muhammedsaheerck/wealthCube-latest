part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isObsecurePassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  const AuthState({
    required this.isObsecurePassword,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  factory AuthState.initial() {
    return AuthState(
        isObsecurePassword: true,
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        formKey: GlobalKey<FormState>());
  }

  AuthState copyWith({
    bool? isObsecurePassword,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) {
    return AuthState(
        isObsecurePassword: isObsecurePassword ?? this.isObsecurePassword,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.passwordController,
        formKey: formKey);
  }

  @override
  List<Object> get props =>
      [isObsecurePassword, emailController, passwordController, formKey];
}
