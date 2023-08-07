import 'package:sastaticket_pokedex/core/keys/app_keys.dart';
import 'package:sastaticket_pokedex/core/spacings/app_spacing.dart';
import 'package:sastaticket_pokedex/generated/l10n.dart';
import 'package:sastaticket_pokedex/router/app_router.dart';
import 'package:sastaticket_pokedex/services/auth_service/login/login_cubit.dart';
import 'package:sastaticket_pokedex/widgets/home_page_widgets/home_page_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
            listenWhen: (p, c) => p.status != c.status,
            listener: (context, state) {

            },
            builder: (context, state) =>
                Scaffold(
                  key: const Key(WidgetKeys.homeScaffoldKey),
                  appBar: AppBar(
                    title: Text(S.of(context).home),
                  ),
                  bottomNavigationBar: Column(
                    children: [
                      Divider(height: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            child: Text(S.of(context).setting),
                            onPressed: () {
                              context.push(AppRouter.settingPath);
                            },
                          ),
                          TextButton(
                            child: Text(S.of(context).favourites),
                            onPressed: () {
                              context.push(AppRouter.imagesFromDbPath);
                            },
                          ),
                          TextButton(
                            child: Text(S.of(context).logout),
                            onPressed: () {
                              context.read<LoginCubit>().signOut();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  body: Center(
                    child: Column(
                      children: [
                        AppSpacing.verticalSpacing32,
                        ElevatedButton(
                          child: Text(S.of(context).pokemon_list),
                          onPressed: () {
                            context.push(AppRouter.pokemonListingPath);
                          },
                        ),
                      ],
                    ),
                  ),
                )
        )
    );
  }
}
