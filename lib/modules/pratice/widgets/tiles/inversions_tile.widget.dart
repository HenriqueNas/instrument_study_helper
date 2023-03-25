import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../entities/inversions.dart';
import '../../states/accord.state.dart';

class InversionTile extends StatelessWidget {
  const InversionTile({super.key, required this.inversion});

  final InversionsEnum inversion;

  @override
  Widget build(BuildContext context) {
    final inversionTitle = Inversions.inversionsSemanticsFromEnum(inversion);

    final accord = context.watch<AccordState>();

    bool value = accord.getValueByInversion(inversion);

    return CupertinoListTile(
      title: Text(inversionTitle),
      leadingToTitle: 8,
      trailing: CupertinoSwitch(
        value: value,
        onChanged: (_) => accord.toggleInversion(inversion),
      ),
    );
  }
}
