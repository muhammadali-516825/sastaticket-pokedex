
import 'package:sastaticket_pokedex/services/auth_service/login/login_cubit.dart';
import 'package:sastaticket_pokedex/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({Key? key, required this.state}) : super(key: key);
  final LoginState state;
  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      name: 'email',
      hint: 'Email',
      keyboardType: TextInputType.emailAddress,
      error: state.email.error?.name,
      onChanged: (email) => context.read<LoginCubit>().emailChanged(email??''),
    );
  }
}

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({Key? key, required this.state}) : super(key: key);
  final LoginState state;
  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      name: 'password',
      padding: const EdgeInsets.symmetric(vertical: 20),
      hint: 'Password',
      isPasswordField: true,
      keyboardType: TextInputType.text,
      error: state.password.error?.name,
      onChanged: (password) => context.read<LoginCubit>().passwordChanged(password??''),
    );
  }
}
