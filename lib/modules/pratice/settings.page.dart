import 'package:flutter/cupertino.dart';

import '../../entities/inversions.dart';
import '../../entities/notes_groups.dart';
import '../../entities/variants.dart';
import 'widgets/tiles/group_tile.widget.dart';
import 'widgets/tiles/inversions_tile.widget.dart';
import 'widgets/tiles/variants_tile.widget.dart';

class PraticeSettingsPage extends StatelessWidget {
  const PraticeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          previousPageTitle: 'Voltar',
          middle: Text('Configurações de prática'),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: kMinInteractiveDimensionCupertino,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CupertinoListSection.insetGrouped(
                      header: const Text('Variantes'),
                      margin: const EdgeInsets.all(16),
                      children: [
                        for (var variant in VariantsEnum.values)
                          VariantsTile(acidental: variant),
                      ],
                    ),
                    CupertinoListSection.insetGrouped(
                      header: const Text('Inversões'),
                      margin: const EdgeInsets.all(16),
                      topMargin: 0,
                      additionalDividerMargin: 0,
                      children: [
                        for (var inversion in InversionsEnum.values)
                          InversionTile(inversion: inversion),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        constraints: const BoxConstraints.expand(),
                        color: CupertinoDynamicColor.resolve(
                          CupertinoColors.systemGroupedBackground,
                          context,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoListSection.insetGrouped(
                  header: const Text('Grupos'),
                  margin: const EdgeInsets.all(16),
                  topMargin: 0,
                  additionalDividerMargin: 0,
                  children: [
                    for (var group in NotesGroupsEnum.values)
                      GroupTile(group: group),
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
