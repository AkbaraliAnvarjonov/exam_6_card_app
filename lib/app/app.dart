import 'package:exam_6_card_app/bloc/card_bloc/card_bloc.dart';
import 'package:exam_6_card_app/bloc/card_bloc/card_event.dart';
import 'package:exam_6_card_app/data/repository/card_repository.dart';
import 'package:exam_6_card_app/ui/card_page/card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CardBloc(CardRepository())..add(GetCards()),
      )
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const CardsPage(),
    );
  }
}
