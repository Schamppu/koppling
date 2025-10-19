import 'package:client/features/koppling/manager/koppling_manager.dart';
import 'package:client/features/koppling_selection/widgets/components/koppling_listing_view_widget.dart';
import 'package:client/widgets/misc/koppling_logo.dart';
import 'package:client/widgets/scaffolds/scaffold_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageKopplingSelection extends ConsumerWidget {
  const PageKopplingSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kopplingID = ref.watch(kopplingProvider.select((state) => state.id));
    return ScaffoldDefault(
      child: Column(
        spacing: 8,
        children: [
          KopplingLogoWidget(),
          Expanded(
            child: KopplingListingView(key: Key('koppling_$kopplingID')),
          ),
        ],
      ),
    );
  }
}
