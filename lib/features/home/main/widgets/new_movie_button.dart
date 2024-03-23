import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/router/router.dart';

class NewMovieButton extends StatelessWidget {
  const NewMovieButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
        onPressed: () => context.router.push(NewMovieRoute()),
        child: const Text(
          'Add new movie',
          style: TextStyle(color: Colors.white),
        ));
  }
}
