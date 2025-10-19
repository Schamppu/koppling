import 'package:client/db/storage_manager.dart';
import 'package:client/features/authentication/manager/auth_manager.dart';
import 'package:client/features/koppling/manager/koppling_manager.dart';
import 'package:client/features/navigation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';

bool hasInitializedManagers = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await storage.init();
  runApp(const ProviderScope(child: KopplingApp()));
}

class KopplingApp extends StatelessWidget {
  const KopplingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EagerProviderInitialization(
      child: ToastificationWrapper(
        config: const ToastificationConfig(),
        child: MaterialApp.router(
          title: 'Koppling',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          routerConfig: KopplingRouter().router,
        ),
      ),
    );
  }
}

class EagerProviderInitialization extends ConsumerWidget {
  const EagerProviderInitialization({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize the providers eagerly
    managerInit(ref);
    return child;
  }
}

Future<void> managerInit(WidgetRef ref) async {
  if (hasInitializedManagers == false) {
    hasInitializedManagers = true;
    Future.delayed(Duration.zero, () async {
      await auth.init(ref);
      await koppling.init(ref);
    });
  }
}
