import 'dart:async';

import 'package:covid_tracker/view/world_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat();

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const WorldStatesScreen(),
          )),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: const SizedBox(
                width: 200,
                height: 200,
                child: Center(
                  child: Image(
                    image: AssetImage('assets/virus.png'),
                  ),
                ),
              ),
              builder: (context, child) => Transform.rotate(
                angle: _controller.value * 2.0 * math.pi,
                child: child,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.10),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Covid 19\nTracker App',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
