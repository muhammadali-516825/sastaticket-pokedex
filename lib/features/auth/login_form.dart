

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';
import 'package:sastaticket_pokedex/core/spacings/app_spacing.dart';
import 'package:sastaticket_pokedex/generated/assets.gen.dart';
import 'package:sastaticket_pokedex/services/auth_service/login/login_cubit.dart';
import 'package:sastaticket_pokedex/widgets/sign_in_page_widgets/constant_texts.dart';
import 'package:sastaticket_pokedex/widgets/sign_in_page_widgets/forgot_password.dart';
import 'package:sastaticket_pokedex/widgets/sign_in_page_widgets/login_with_email_buttons.dart';
import 'package:sastaticket_pokedex/widgets/sign_in_page_widgets/sign_in_page_input_fields.dart';
import 'package:sastaticket_pokedex/widgets/sign_in_page_widgets/social_sign_in_buttons.dart';
import 'package:sastaticket_pokedex/widgets/snackbar_widgets/snackbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';


final formKeyLogin = GlobalKey<FormBuilderState>();
class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
            listenWhen: (p, c) => p.status != c.status,
            listener: (context, state) {
              if (state.status.isSubmissionFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(snackBarWhenFailure(snackBarFailureText: state.exceptionError));
              } else if (state.status.isSubmissionSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(snackBarWhenSuccess());
              }
            },
            builder: (context, state) => Stack(children: [
                  Positioned.fill(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(38.0, 0, 38.0, 8.0),
                      child: FormBuilder(
                        key: formKeyLogin,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppSpacing.verticalSpacing48,
                              const LoginText(),
                              Lottie.asset(
                                Assets.lottie.pokemonBall,
                                height: 100,
                              ),
                              AppSpacing.verticalSpacing48,
                              EmailInputField(state: state),
                              PasswordInputField(state: state),
                              Login(),
                              Row(
                                children: const [
                                  Expanded(child: SignUpButton()),

                                  Expanded(child: ForgotPassword())
                                ],
                              ),
                              /*Column(children: const [
                              SeperatedText(),
                              SignInWithGoogle(),
                              SignInWithGithub(),
                              SignInWithTwitter(),
                              SignInWithApple(),
                              SignInWithMicrosoft()
                            ])*/
                            ]
                        ),
                      ),
                    ),
                  ),
                  state.status.isSubmissionInProgress
                      ? const Positioned(
                          child: Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container()
                ])));
  }
}
