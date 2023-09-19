import 'package:flutter/material.dart' hide Actions;

import '../../entities/inversions.dart';
import '../../entities/notes_groups.dart';
import '../../entities/variants.dart';
import 'widgets/tiles/group_tile.widget.dart';
import 'widgets/tiles/inversions_tile.widget.dart';
import 'widgets/tiles/variants_tile.widget.dart';

class PraticeSettingsPage extends StatelessWidget {
  const PraticeSettingsPage({super.key});

  static const String routeName = '/pratice-settings';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configurações de prática'),
        ),
        body: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Grupos'),
              ),
              for (var group in NotesGroupsEnum.values) GroupTile(group: group),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Variantes'),
                        ),
                        for (var variant in VariantsEnum.values)
                          VariantsTile(acidental: variant),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Inversões'),
                        ),
                        for (var inversion in InversionsEnum.values)
                          InversionTile(inversion: inversion),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
