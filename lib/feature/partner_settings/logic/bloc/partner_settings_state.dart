part of 'partner_settings_bloc.dart';

@immutable
sealed class PartnerSettingsState {
  const PartnerSettingsState();
}

final class PartnerSettingsInitial extends PartnerSettingsState {
  const PartnerSettingsInitial();
}

final class PartnerSettingsLoading extends PartnerSettingsState {
  const PartnerSettingsLoading();
}

final class PartnerSettingsLoaded extends PartnerSettingsState {
  const PartnerSettingsLoaded();
}

final class PartnerSettingsError extends PartnerSettingsState {
  const PartnerSettingsError();
}
