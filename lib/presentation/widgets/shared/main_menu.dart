import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: menuItems
          .map((item) => HomeMenuItem(
              title: item.title,
              icon: item.icon,
              route: item.route,
              bgColors: item.colors))
          .toList(),
    );
  }
}

//--------------------- HomeMenuItem -----------------------------------

class HomeMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  final List<Color> bgColors;

  const HomeMenuItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.route,
      this.bgColors = const [Colors.lightBlue, Colors.blue]});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: bgColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

//----------------------------------------------------------------

final List<MenuItem> menuItems = [
  MenuItem(
      title: 'Giroscopio',
      icon: Icons.downloading,
      route: '/gyroscope',
      colors: [Colors.red, Colors.pink]),
  MenuItem(
      title: 'Acelerómetro',
      icon: Icons.speed,
      route: '/accelerometer',
      colors: [Colors.greenAccent, Colors.green]),
  MenuItem(
      title: 'Magnetómetro',
      icon: Icons.explore_outlined,
      route: '/magnetometer',
      colors: [Colors.yellow, Colors.orange]),
  MenuItem(
      title: 'Gisroscopio Ball',
      icon: Icons.sports_baseball_outlined,
      route: '/gyroscope-ball',
      colors: [Colors.purpleAccent, Colors.purple]),
  MenuItem(
      title: 'Brújula',
      icon: Icons.explore,
      route: '/compass',
      colors: [Colors.lightBlueAccent, Colors.blue]),
  MenuItem(
      title: 'Pokemons',
      icon: Icons.catching_pokemon,
      route: '/pokemons',
      colors: [Colors.cyanAccent, Colors.cyan]),
  MenuItem(
      title: 'Biometrics',
      icon: Icons.fingerprint,
      route: '/biometrics',
      colors: [Colors.blueAccent, Colors.blue]),
  MenuItem(
      title: 'Ubicación',
      icon: Icons.pin_drop,
      route: '/location',
      colors: [Colors.red, Colors.redAccent]),
  MenuItem(
      title: 'Mapas',
      icon: Icons.map_outlined,
      route: '/maps',
      colors: [Colors.green, Colors.greenAccent]),
  MenuItem(
      title: 'Controlado',
      icon: Icons.gamepad_outlined,
      route: '/controlled-map',
      colors: [Colors.orange, Colors.orangeAccent]),
  MenuItem(
      title: 'Badge',
      icon: Icons.notification_important,
      route: '/badge',
      colors: [Colors.green, Colors.lightGreen]),
  MenuItem(
      title: 'Ad Full',
      icon: Icons.ad_units_rounded,
      route: '/ad-fullscreen',
      colors: [Colors.deepOrange, Colors.yellowAccent]),
  MenuItem(
      title: 'Ad Reward',
      icon: Icons.fort_sharp,
      route: '/ad-rewarded',
      colors: [Colors.deepPurple, Colors.lightBlue]),
  MenuItem(
      title: 'Backround Process',
      icon: Icons.storage_rounded,
      route: '/db-pokemons',
      colors: [Colors.tealAccent, Colors.teal]),
];

//----------------------------------------------------------------
class MenuItem {
  final String title;
  final IconData icon;
  final String route;
  final List<Color> colors;

  MenuItem(
      {required this.title,
      required this.icon,
      required this.route,
      this.colors = const [Colors.lightBlue, Colors.blue]});
}
