import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/instance_manager.dart';
import 'package:very_good_coffee_app/global/routing/router.dart';
import 'package:very_good_coffee_app/modules/home/domain/bloc/home_bloc.dart';
import 'package:very_good_coffee_app/modules/home/domain/home_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(CoffeeClient());

    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
