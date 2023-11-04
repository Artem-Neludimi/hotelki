import 'package:flutter/material.dart';

import '../../../../core/localization/generated/l10n.dart';

class PartnerSettingsPage extends StatelessWidget {
  const PartnerSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).partner),
      ),
    );
  }
}
