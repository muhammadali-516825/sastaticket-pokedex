
import 'package:sastaticket_pokedex/services/auth_service/sign_up/sign_up_cubit.dart';
import 'package:sastaticket_pokedex/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NameInputField extends StatelessWidget {
  const NameInputField({Key? key, required this.state}) : super(key: key);
  final SignUpState state;
  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      name: 'name',
      padding: const EdgeInsets.symmetric(vertical: 10),
      hint: 'Name Surname',
      keyboardType: TextInputType.name,
      error: state.name.error?.name,
      onChanged: (name) => context.read<SignUpCubit>().nameChanged(name??''),
    );
  }
}

class SignUpPageEmailInputField extends StatelessWidget {
  const SignUpPageEmailInputField({Key? key, required this.state}) : super(key: key);
  final SignUpState state;
  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      name: 'email',
      padding: const EdgeInsets.symmetric(vertical: 10),
      hint: 'Email',
      keyboardType: TextInputType.emailAddress,
      error: state.email.error?.name,
      onChanged: (email) => context.read<SignUpCubit>().emailChanged(email??''),
    );
  }
}

class SignUpPagePasswordInputField extends StatelessWidget {
  const SignUpPagePasswordInputField({Key? key, required this.state}) : super(key: key);
  final SignUpState state;
  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      name: 'password',
      padding: const EdgeInsets.symmetric(vertical: 10),
      hint: 'Password',
      isPasswordField: true,
      keyboardType: TextInputType.text,
      error: state.password.error?.name,
      onChanged: (password) => context.read<SignUpCubit>().passwordChanged(password??''),
    );
  }
}

class RePasswordInputField extends StatelessWidget {
  const RePasswordInputField({Key? key, required this.state}) : super(key: key);
  final SignUpState state;
  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      name: 're-password',
      padding: const EdgeInsets.symmetric(vertical: 10),
      hint: 'Re-Password',
      isPasswordField: true,
      keyboardType: TextInputType.text,
      error: state.rePassword.error?.name,
      onChanged: (rePassword) => context.read<SignUpCubit>().rePasswordChanged(rePassword??''),
    );
  }
}
