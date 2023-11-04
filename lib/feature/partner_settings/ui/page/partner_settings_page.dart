import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/extension/context.dart';
import 'package:scalable_flutter_app_starter/feature/partner_settings/logic/bloc/partner_settings_bloc.dart';

import '../../../../core/localization/generated/l10n.dart';

class PartnerSettingsPage extends StatefulWidget {
  const PartnerSettingsPage({super.key, required this.partnerEmail});

  final String? partnerEmail;

  @override
  State<PartnerSettingsPage> createState() => _PartnerSettingsPageState();
}

class _PartnerSettingsPageState extends State<PartnerSettingsPage> {
  @override
  void initState() {
    super.initState();
    context.read<PartnerSettingsBloc>().add(StartedEventPartnerSettings(widget.partnerEmail));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).partner),
      ),
      body: const _PartnerSettingsBody(),
    );
  }
}

class _PartnerSettingsBody extends StatelessWidget {
  const _PartnerSettingsBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnerSettingsBloc, PartnerSettingsState>(
      builder: (context, state) {
        if (state is PartnerSettingsLoading) return const Center(child: CircularProgressIndicator());
        if (state.partnerEmail != null) return Center(child: Text(state.partnerEmail!));

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).sendToPartner),
              IconButton(
                onPressed: () {
                  context.showSnackBarMessage(S.of(context).linkCopied);
                },
                icon: const Icon(Icons.link),
              ),
            ],
          ),
        );
      },
    );
  }
}
