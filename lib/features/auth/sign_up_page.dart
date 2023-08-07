import 'package:sastaticket_pokedex/features/auth/sign_up_form.dart';
import 'package:sastaticket_pokedex/services/auth_service/sign_up/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => SignUpCubit(),
        child: const SignUpForm(),
      ),
    );
  }
}
