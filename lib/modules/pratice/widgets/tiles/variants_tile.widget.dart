import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../entities/variants.dart';
import '../../states/accord.state.dart';

class VariantsTile extends StatefulWidget {
  const VariantsTile({super.key, required this.acidental});

  final VariantsEnum acidental;

  @override
  State<VariantsTile> createState() => _VariantsTileState();
}

class _VariantsTileState extends State<VariantsTile> {
  @override
  Widget build(BuildContext context) {
    final pageWidth = MediaQuery.of(context).size.width;
    final isMobileSize = pageWidth < 600;

    final accord = context.watch<AccordState>();

    bool value = accord.getValueByVariant(widget.acidental);

    return CupertinoListTile(
      title: Text(
        Variants.variantsSemanticsFromEnum(widget.acidental),
        style: const TextStyle(fontSize: 12),
      ),
      leading: isMobileSize
          ? null
          : Text(
              Variants.variantsFromEnum(widget.acidental),
              style: const TextStyle(fontSize: 16),
            ),
      leadingToTitle: 8,
      trailing: CupertinoSwitch(
        value: value,
        onChanged: (_) => accord.toggleVariant(widget.acidental),
      ),
    );
  }
}
