import 'package:client/features/authentication/manager/auth_manager.dart';
import 'package:client/features/navigation/router/router.dart';
import 'package:client/features/networking/functions/networking.dart';
import 'package:client/features/networking/functions/urls.dart';
import 'package:client/features/theme/theme_extension.dart';
import 'package:client/features/toasts/functions/toast_functions.dart';
import 'package:client/widgets/buttons/button_default.dart';
import 'package:client/widgets/cards/card_default.dart';
import 'package:client/widgets/forms/field_default.dart';
import 'package:client/widgets/misc/koppling_logo.dart';
import 'package:client/widgets/scaffolds/scaffold_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageAuth extends ConsumerWidget {
  const PageAuth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authInitialized = ref.watch(
      authProvider.select((state) => state.initialized),
    );
    return ScaffoldDefault(
      child: Column(
        spacing: 8,
        children: [
          Center(child: KopplingLogoWidget()),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'en koppling',
                style: context.theme.fonts.highlightItalic,
                children: [
                  TextSpan(
                    text: ' means connection and I ❤️ Swedish',
                    style: context.theme.fonts.primary,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          authInitialized
              ? CardDefault(
                  child: Column(
                    spacing: 16,
                    children: [
                      Text('Login', style: context.theme.fonts.primary),
                      FieldDefault(
                        label: 'Username',
                        icon: Icons.person,
                        onChanged: (text) {
                          auth.update(auth.state.copyWith(username: text));
                        },
                      ),
                      FieldDefault(
                        label: 'Password',
                        icon: Icons.lock,
                        isPassword: true,
                        onChanged: (text) {
                          auth.update(auth.state.copyWith(password: text));
                        },
                      ),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          ButtonDefault(
                            label: 'Login',
                            icon: Icons.login,
                            onPressed: () async {
                              final response = await net.post(
                                loginEndpoint,
                                data: {
                                  'username': auth.state.username,
                                  'password': auth.state.password,
                                },
                              );
                              if (response.statusCode == 200) {
                                auth.update(
                                  auth.state.copyWith(
                                    authenticated: true,
                                    username: auth.state.username,
                                    password: auth.state.password,
                                  ),
                                );
                              }
                              if (!context.mounted) return;
                              showSuccess(
                                title: 'Login Successful',
                                message:
                                    'Welcome ${auth.state.username}. Time to learn some Swedish! 💪',
                                icon: Icons.check_circle,
                              );
                              router.replace('/selection');
                            },
                          ),
                          ButtonDefault(
                            label: 'Sign Up',
                            icon: Icons.person_add,
                            onPressed: () async {
                              final response = await net.post(
                                registerEndpoint,
                                data: {
                                  'username': auth.state.username,
                                  'password': auth.state.password,
                                },
                              );
                              if (response.statusCode == 200) {
                                auth.update(
                                  auth.state.copyWith(
                                    authenticated: true,
                                    username: auth.state.username,
                                    password: auth.state.password,
                                  ),
                                );
                              }
                              if (!context.mounted) return;
                              showSuccess(
                                title: 'Registration Successful',
                                message:
                                    'Hell yeah 🤘! Welcome ${auth.state.username}. Time to learn some Swedish! 💪',
                                icon: Icons.check_circle,
                              );
                              router.replace('/selection');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
