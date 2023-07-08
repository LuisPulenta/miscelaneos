import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  const GyroscopeBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(accelerometerGravityProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscopio Ball'),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: gyroscope$.when(
            data: (value) => MovingBall(x: value.x, y: value.y),
            error: (error, stackTrace) => Text('$error'),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}

//--------------------------------------------------------------

class MovingBall extends StatelessWidget {
  final double x;
  final double y;

  const MovingBall({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;

    double currentXPos = (x * 50);
    double currentYPos = (y * 50);

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          top: (currentYPos - 25) + (screenWidth / 2),
          left: (currentXPos - 25) + (screenHeight / 2),
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          child: const Ball(),
        ),
        Text('''
x: $x,
y: $y,
      ''', style: const TextStyle(fontSize: 30)),
      ],
    );
  }
}

//--------------------------------------------------------------

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
