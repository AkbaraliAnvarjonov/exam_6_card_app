import 'package:exam_6_card_app/app/app.dart';
import 'package:exam_6_card_app/app/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
