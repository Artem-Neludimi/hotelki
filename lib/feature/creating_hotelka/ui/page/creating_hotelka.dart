// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:scalable_flutter_app_starter/core/extension/context.dart';
import 'package:scalable_flutter_app_starter/feature/creating_hotelka/logic/creating_hotelka_notifier.dart';

import '../../../../core/localization/generated/l10n.dart';
import '../../../auth/logic/bloc/auth_bloc.dart';
import '../widget/creating_hotelka_components.dart';

class CreatingHotelkaPage extends StatefulWidget {
  const CreatingHotelkaPage({super.key, required this.categoriesString});

  final List<String> categoriesString;

  @override
  State<CreatingHotelkaPage> createState() => _CreatingHotelkaPageState();
}

class _CreatingHotelkaPageState extends State<CreatingHotelkaPage> {
  @override
  void initState() {
    super.initState();
    context.read<CreatingHotelkaNotifier>().init(widget.categoriesString);
  }

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
      onPressed: () async {
        try {
          final user = context.read<AuthBloc>().state.user!;
          final hotelka = await context.read<CreatingHotelkaNotifier>().createHotelka(user.partnerEmail!);
          context.pop(hotelka);
        } catch (e) {
          if (e == 'fill required fields') {
            final message = S.of(context).fillRequiredFields;
            context.showSnackBarMessage(message);
          }
        }
      },
      label: Text(S.of(context).createHotelka),
    );
  }
}
