import 'package:flutter/material.dart';

class PokemonScreen extends StatelessWidget {
  final String pokemonId;

  const PokemonScreen({Key? key, required this.pokemonId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon: $pokemonId'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('PokemonScreen'),
      ),
    );
  }
}
