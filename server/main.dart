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
  // [A05 - Security Misconfiguration]
  // These should be removed so that no default admin user exists.
  final existingAdmin = await db
      .customSelect(
        "SELECT * FROM users_table WHERE username = 'admin'",
      )
      .getSingleOrNull();
  if (existingAdmin == null) {
    await db.customInsert(
      "INSERT INTO users_table (username, password) VALUES ('admin', 'admin')",
    );
  }
  return serve(handler, ip, port);
}
