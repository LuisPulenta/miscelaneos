import 'package:miscelaneos/domain/domain.dart';
import 'package:workmanager/workmanager.dart';

import '../../infrastructure/infrastructure.dart';

const fetchBackgroundTaskKey =
    'com.luisnu.miscelaneos.fetch-background-pokemon';
const fetchPeriodicBackgroundTaskKey =
    'com.luisnu.miscelaneos.fetch-background-pokemon';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackgroundTaskKey:
        await loadNextPokemon();
        break;
      case fetchPeriodicBackgroundTaskKey:
        print('fetchPeriodicBackgroundTaskKey');
        break;
      case Workmanager.iOSBackgroundTask:
        print('Workmanager.iOSBackgroundTask');
        break;
    }

    return true;

    // print(
    //     "Native: called background task: $task"); //simpleTask will be emitted here.
    // return Future.value(true);
  });
}

Future loadNextPokemon() async {
  final localDbRepository = LocalDbRepositoryImpl();
  final lastPokemonId = await localDbRepository.pokemonCount() + 1;
  final pokemonRepository = PokemonsRepositoryImpl();

  try {
    final (pokemon, message) =
        await pokemonRepository.getPokemon('$lastPokemonId');

    if (pokemon == null) throw message;

    await localDbRepository.insertPokemon(pokemon);
    print('Pokemon inserted: ${pokemon.name}!!');
  } catch (e) {
    print('$e');
  }
}
