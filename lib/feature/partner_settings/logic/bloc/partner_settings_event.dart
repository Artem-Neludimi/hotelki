part of 'partner_settings_bloc.dart';

@immutable
sealed class PartnerSettingsEvent {}

class StartedEventPartnerSettings extends PartnerSettingsEvent {
  final String? linkEmail;
  final UserModel user;

  StartedEventPartnerSettings(this.linkEmail, this.user);
}
