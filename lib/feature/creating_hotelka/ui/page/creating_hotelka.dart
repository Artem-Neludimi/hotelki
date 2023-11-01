import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:scalable_flutter_app_starter/feature/creating_hotelka/logic/creating_hotelka_notifier.dart';

import '../../../../core/localization/generated/l10n.dart';
import '../widget/creating_hotelka_components.dart';

class CreatingHotelkaPage extends StatelessWidget {
  const CreatingHotelkaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<CreatingHotelkaNotifier>().scaffoldKey,
      appBar: AppBar(title: Text(S.of(context).creatingHotelka), centerTitle: true),
      floatingActionButton: const _CreatingHotelkaFloating(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NameCreatingHotelkaField(),
              Gap(16),
              DescriptionCreatingHotelkaField(),
              Gap(16),
              ReferencesCreatingHotelkaField(),
              Gap(16),
              ImportantCheckBox(),
              Gap(16),
              DateCreatingHotelkaField(),
              Gap(16),
              CategoryCreatingHotelkaField(),
              Gap(120),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreatingHotelkaFloating extends StatelessWidget {
  const _CreatingHotelkaFloating();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => context.pop(),
      label: Text(S.of(context).createHotelka),
    );
  }
}
