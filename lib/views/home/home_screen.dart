import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Start',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.settings,
                  color: lightColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
