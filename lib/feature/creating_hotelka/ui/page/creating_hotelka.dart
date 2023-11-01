import 'package:flutter/material.dart';

import '../../../../core/localization/generated/l10n.dart';

class CreatingHotelkaPage extends StatelessWidget {
  const CreatingHotelkaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).creatingHotelka)),
      body: const Center(child: Text('CreatingHotelka')),
    );
  }
}
