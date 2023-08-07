import 'package:another_flushbar/flushbar.dart';
import 'package:sastaticket_pokedex/core/spacings/app_spacing.dart';
import 'package:sastaticket_pokedex/features/demo/bloc/demo_bloc.dart';
import 'package:sastaticket_pokedex/generated/l10n.dart';
import 'package:sastaticket_pokedex/injector/injector.dart';
import 'package:sastaticket_pokedex/widgets/error_page.dart';
import 'package:sastaticket_pokedex/widgets/loading_page.dart';
import 'package:sastaticket_pokedex/widgets/pokemon_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_client/rest_client.dart';

class ImagesFromDbPage extends StatelessWidget {
  const ImagesFromDbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DemoBloc>(
      create: (context) => Injector.instance<DemoBloc>()
        ..add(
          const DemoEvent.loadImageFromDB(),
        ),
      child: const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(S.current.favourites),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<DemoBloc, DemoState>(
        listenWhen: (prev, next) => prev.status != next.status,
        listener: (context, state) {
          state.notification?.when(
            insertSuccess: (message) {
              Flushbar(
                message: message,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.green,
              ).show(context);
            },
            insertFailed: (message) {
              Flushbar(
                message: message,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.red,
              ).show(context);
            },
          );
        },
        buildWhen: (prev, next) =>
            prev.status != next.status || prev.isBusy != next.isBusy,
        builder: (context, state) {
          return state.status.when<Widget>(
            initial: () {
              return const LoadingPage();
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
              return Stack(
                children: [
                  _buildImages(state.pokemonList),
                  if (state.isBusy) const LoadingPage(),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildImages(List<PokemonSpecies> pokemonList) {
    return ListView.separated(
      itemBuilder: (context, index) => Column(
        children: [
          ListTile(
            leading: PokemonAvatar(picUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonList[index].url.split('/')[pokemonList[index].url.split('/').length-2]}.png',),
            title: Text(pokemonList[index].name),
            trailing: IconButton(onPressed: (){
              context.read<DemoBloc>().add(
                DemoEvent.deleteImageFromDB(
                  pokemonSpecies: pokemonList[index],
                ),
              );
            }, icon: Icon(Icons.favorite)),
          ),
          Divider()
        ],
      ),
      separatorBuilder: (context, index) => AppSpacing.verticalSpacing6,
      itemCount: pokemonList.length,
    );
  }
}
