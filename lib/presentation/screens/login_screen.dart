import 'package:fake_store/common/extensions/context_ext.dart';
import 'package:fake_store/common/widgets/custom_gap.dart';
import 'package:fake_store/common/widgets/default_button.dart';
import 'package:fake_store/presentation/widgets/auth_back_button.dart';
import 'package:fake_store/presentation/widgets/auth_text_field.dart';
import 'package:fake_store/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../common/constants/ui_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);

  @override
  void dispose() {
    _obscurePassword.dispose();
    super.dispose();
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(homeRoute, (Route route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }

        if (state.isSuccess) {
          _navigateToHome(context);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: UIConstants.defaultHorizontalPadding,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalGap(12),
                  AuthBackButton(),
                  const VerticalGap(28),
                  Text(
                    'Welcome back! Glad\nto see you, Again!',
                    style: context.text.titleLarge,
                  ),
                  const VerticalGap(32),
                  AuthTextField(
                    onChanged: cubit.updateUsername,
                    hint: 'Enter your username',
                    textInputAction: TextInputAction.next,
                  ),
                  const VerticalGap(15),
                  BlocBuilder<AuthCubit, AuthState>(
                    buildWhen: (prev, curr) => prev.password != curr.password,
                    builder:
                        (context, state) => ValueListenableBuilder<bool>(
                          valueListenable: _obscurePassword,
                          builder: (_, isObscure, __) {
                            return AuthTextField(
                              onChanged: cubit.updatePassword,
                              hint: 'Enter your password',
                              obscureText: isObscure,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  size: 22,
                                  color: Colors.grey.shade600,
                                ),
                                onPressed:
                                    () => _obscurePassword.value = !isObscure,
                              ),
                            );
                          },
                        ),
                  ),
                  const VerticalGap(30),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder:
                        (context, state) => DefaultButton(
                          text: 'Login',
                          onPress: cubit.login,
                          isLoading: state.isLoading,
                          isEnabled: cubit.isValid(),
                          mode: ButtonMode.dark,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
