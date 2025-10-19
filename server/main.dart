import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:server/db/database.dart';
import 'package:server/features/content_manager/content_manager.dart';
import 'package:server/features/kopplings/functions/generate_koppling.dart';

/// This is called only once when the server starts.
Future<void> init(InternetAddress ip, int port) async {
  // Initialize the database
  await DatabaseManager().init();
}

/// This is called every time the server is restarted or hot reloaded.
Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  // Initialize the content manager
  await content.init();
  await generateKoppling();
  return serve(handler, ip, port);
}
