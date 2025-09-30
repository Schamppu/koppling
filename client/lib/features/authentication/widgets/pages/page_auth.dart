import 'package:client/features/theme/theme_extension.dart';
import 'package:client/widgets/buttons/button_default.dart';
import 'package:client/widgets/cards/card_default.dart';
import 'package:client/widgets/forms/field_default.dart';
import 'package:client/widgets/scaffolds/scaffold_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageAuth extends ConsumerWidget {
  const PageAuth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldDefault(
      child: Column(
        spacing: 8,
        children: [
          Center(child: Text('KOPPLING', style: context.theme.fonts.titleFont)),
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
          CardDefault(
            child: Column(
              spacing: 16,
              children: [
                Text('Login', style: context.theme.fonts.primary),
                const FieldDefault(label: 'Username', icon: Icons.person),
                const FieldDefault(
                  label: 'Password',
                  icon: Icons.lock,
                  isPassword: true,
                ),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    ButtonDefault(label: 'Login', icon: Icons.login),
                    ButtonDefault(label: 'Sign Up', icon: Icons.person_add),
                    ButtonDefault(
                      label: 'Continue as Guest',
                      icon: Icons.person_outline,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
