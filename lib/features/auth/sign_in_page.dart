import 'package:sastaticket_pokedex/features/auth/login_form.dart';
import 'package:sastaticket_pokedex/services/auth_service/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: SignInPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.blueGrey[100],
      body: BlocProvider(
        create: (_) => LoginCubit(),
        child: const LoginForm(),
      ),
    );
  }
}
