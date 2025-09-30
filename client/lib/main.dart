import 'package:client/features/authentication/widgets/pages/page_auth.dart';
import 'package:client/features/networking/functions/networking.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  final response = await net.get('/');
  print('Response data: ${response.data}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koppling',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PageAuth(),
    );
  }
}
