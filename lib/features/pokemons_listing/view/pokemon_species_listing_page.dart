import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:go_router/go_router.dart';
import 'package:sastaticket_pokedex/core/dimens/app_dimens.dart';
import 'package:sastaticket_pokedex/core/spacings/app_spacing.dart';
import 'package:sastaticket_pokedex/features/pokemons_listing/bloc/pokemon_species_bloc.dart';
import 'package:sastaticket_pokedex/generated/l10n.dart';
import 'package:sastaticket_pokedex/injector/injector.dart';
import 'package:sastaticket_pokedex/router/app_router.dart';
import 'package:sastaticket_pokedex/services/auth_service/login/login_cubit.dart';
import 'package:sastaticket_pokedex/widgets/error_page.dart';
import 'package:sastaticket_pokedex/widgets/loading_page.dart';
import 'package:sastaticket_pokedex/widgets/pokemon_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class PokemonListingPage extends StatefulWidget {
  const PokemonListingPage({super.key});

  static Page page() => const MaterialPage<void>(child: PokemonListingPage());

  @override
  State<PokemonListingPage> createState() => _PokemonListingPageState();
}

class _PokemonListingPageState extends State<PokemonListingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonSpeciesBloc>(
      create: (context) {
        return Injector.instance<PokemonSpeciesBloc>();
      },
      child: Scaffold(
        appBar: _AppBar(),
        body: _Body(),
        bottomNavigationBar: BlocProvider<LoginCubit>(
            create: (subContext) => LoginCubit(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  height: 2,
                ),
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
                        LoginCubit().signOut();
                      },
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(S.current.pokemon_list),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

bool pokemonSelected = false;
class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    context.read<PokemonSpeciesBloc>().add(const PokemonSpeciesEvent.randomRequested());
    //return SizedBox();
    return Center(
      child: BlocConsumer<PokemonSpeciesBloc, PokemonSpeciesState>(
        listenWhen: (prev, next) => prev.notification != next.notification,
        listener: (context, state) {
          state.notification?.when(
            notifySuccess: (message) {
              if(message.contains('pokemon details loaded')){
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 2, maxWidth: MediaQuery.of(context).size.width),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    builder: (BuildContext contextModal) {

                      return Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: PokemonAvatar(
                                  picUrl:
                                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/'
                                      'sprites/pokemon/other/official-artwork/${state.pokemonSelected.id}.png',
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                elevation: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width - 50,
                                    child: Row(
                                      children: [
                                        Text('name:'),
                                        Spacer(),
                                        Text(state.pokemonSelected.name),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      );
                    });
              }
              Flushbar(
                message: message,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.green,
              ).show(context);
            },
            notifyFailed: (message) {
              Flushbar(
                message: message,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.red,
              ).show(context);
            },
          );
        },
        buildWhen: (prev, next) => prev.status != next.status || prev.isBusy != next.isBusy,
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              state.status.when<Widget>(
                initial: () {
                  return const SizedBox();
                },
                loading: () {
                  return const LoadingPage();
                },
                loadFailed: (message) {
                  return ErrorPage(
                    content: message,
                  );
                },
                loadSuccess: (message) {
                  return ListView(
                    children: state.pokedexData.species.map((speciesElement) {
                      final urlSplits = speciesElement.url.split('/');
                      return Column(
                        children: [
                          ListTile(
                            leading: PokemonAvatar(
                              picUrl:
                                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${urlSplits[urlSplits.length - 2]}.png',
                            ),
                            title: Text(speciesElement.name),
                            trailing: IconButton(
                                onPressed: () {
                                  context.read<PokemonSpeciesBloc>().add(
                                        PokemonSpeciesEvent.favouriteMarked(
                                          pokemonSpecies: speciesElement,
                                        ),
                                      );
                                },
                                icon: Icon(Icons.favorite_outline)),
                            onTap: () {
                              pokemonSelected = true;
                              context.read<PokemonSpeciesBloc>().add(
                                PokemonSpeciesEvent.pokemonSelected(
                                  pokemonSpecies: speciesElement,
                                ),
                              );

                            },
                          ),
                          Divider()
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
              if (state.isBusy) const LoadingPage(),
            ],
          );
        },
      ),
    );
  }

  Widget pokemonLoadingWidget(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white10,
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PokemonAvatar(),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.grey,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 35,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.grey,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 35,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ));
  }
}
