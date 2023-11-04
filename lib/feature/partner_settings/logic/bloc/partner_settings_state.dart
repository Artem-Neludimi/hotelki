part of 'partner_settings_bloc.dart';

@immutable
sealed class PartnerSettingsState {
  const PartnerSettingsState(this.partnerEmail);

  final String? partnerEmail;
}

final class PartnerSettingsInitial extends PartnerSettingsState {
  const PartnerSettingsInitial() : super(null);
}

final class PartnerSettingsLoading extends PartnerSettingsState {
  const PartnerSettingsLoading() : super(null);
}

final class PartnerSettingsLoaded extends PartnerSettingsState {
  const PartnerSettingsLoaded(super.partnerEmail);
}

final class PartnerSettingsError extends PartnerSettingsState {
  const PartnerSettingsError() : super(null);
}
