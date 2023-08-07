import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sastaticket_pokedex/generated/assets.gen.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF000000).withOpacity(0.1),
      child: Center(
        child: InkWell(
          child: Lottie.asset(
            Assets.lottie.pokemonLoading,
            height: 100,
          ),
        ),
      ),
    );
  }
}
