import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/extension/context.dart';
import 'package:scalable_flutter_app_starter/core/navigation/route.dart';
import 'package:scalable_flutter_app_starter/feature/partner_settings/logic/bloc/partner_settings_bloc.dart';

import '../../../../core/localization/generated/l10n.dart';
import '../../../auth/logic/bloc/auth_bloc.dart';

class PartnerSettingsPage extends StatefulWidget {
  const PartnerSettingsPage({super.key, required this.linkEmail});

  final String? linkEmail;

  @override
  State<PartnerSettingsPage> createState() => _PartnerSettingsPageState();
}

class _PartnerSettingsPageState extends State<PartnerSettingsPage> {
  @override
  void initState() {
    super.initState();
    final user = context.read<AuthBloc>().state.user;
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        AppRoute.auth.go(context);
      });
      AppRoute.auth.go(context);
    } else {
      context.read<PartnerSettingsBloc>().add(StartedEventPartnerSettings(widget.linkEmail, user));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: widget.linkEmail == null
            ? null
            : IconButton(
                onPressed: () {
                  AppRoute.home.go(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
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
    final user = context.watch<AuthBloc>().state.user!;

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
                onPressed: () async {
                  Clipboard.setData(ClipboardData(text: 'hotelki://${user.email}')).whenComplete(() {
                    context.showSnackBarMessage(S.of(context).linkCopied);
                  });
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
