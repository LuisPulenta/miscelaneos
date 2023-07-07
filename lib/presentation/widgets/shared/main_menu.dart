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
              title: item.title, icon: item.icon, route: item.route))
          .toList(),
    );
  }
}

//----------------------------------------------------------------

final List<MenuItem> menuItems = [
  MenuItem(title: 'Giroscopio', icon: Icons.downloading, route: '/gyroscope'),
  MenuItem(title: 'Acelerómetro', icon: Icons.speed, route: '/accelerometer'),
  MenuItem(
      title: 'Magnetómetro',
      icon: Icons.explore_outlined,
      route: '/magnetometer'),
  MenuItem(
      title: 'Gisroscopio Ball',
      icon: Icons.sports_baseball_outlined,
      route: '/gyroscope-ball'),
  MenuItem(title: 'Brújula', icon: Icons.explore, route: '/compass'),
];

//----------------------------------------------------------------
class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem({required this.title, required this.icon, required this.route});
}

//----------------------------------------------------------------

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
