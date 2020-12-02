import 'bloc/dice_bloc.dart';
import 'bloc/bloc.dart';
import 'screen/dice/dice_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _blocs = <Bloc>[];

  @override
  void initState() {
    super.initState();
    DiceBloc bloc = DiceBloc();
    _blocs.add(bloc);
    _blocs.forEach((bloc) {
      bloc.initialize();
    });
  }

  @override
  void dispose() {
    _blocs.forEach((bloc) {
      bloc.dispose();
    });
    super.dispose();
  }

  T getDesireBloc<T extends Bloc>() {
    return _blocs.firstWhere(
      (bloc) {
        return (bloc is T);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DiceScreen(
        title: 'Dice Onboarding',
        diceBloc: getDesireBloc<DiceBloc>(),
      ),
    );
  }
}
