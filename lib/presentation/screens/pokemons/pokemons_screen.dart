import 'package:flutter/material.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PokemonsView(),
    );
  }
}

//-------------------------------------------------------------
class PokemonsView extends StatefulWidget {
  const PokemonsView({super.key});

  @override
  State<PokemonsView> createState() => _PokemonsViewState();
}

class _PokemonsViewState extends State<PokemonsView> {
  final scrollCOntroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          centerTitle: true,
          floating: true,
          backgroundColor: Colors.white.withOpacity(0.8),
        )
      ],
    );
  }
}
