import 'package:sastaticket_pokedex/features/auth/sign_in_page.dart';
import 'package:sastaticket_pokedex/features/home/home_page.dart';
import 'package:sastaticket_pokedex/features/pokemons_listing/view/pokemon_species_listing_page.dart';
import 'package:sastaticket_pokedex/router/app_router.dart';
import 'package:sastaticket_pokedex/services/auth_service/auth_cubit.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AuthState>(
      state: context.select((AuthCubit cubit) => cubit.state),
      onGeneratePages: (authState, pages) {
        if (authState.isSignedIn) {
          return [PokemonListingPage.page()];
        } else {
          return [SignInPage.page()];
        }
      },
    );
  }
}
