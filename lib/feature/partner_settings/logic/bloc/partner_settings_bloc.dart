import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/user/user_model.dart';
import 'package:scalable_flutter_app_starter/feature/partner_settings/data/partner_settings_repository.dart';

part 'partner_settings_event.dart';
part 'partner_settings_state.dart';

class PartnerSettingsBloc extends Bloc<PartnerSettingsEvent, PartnerSettingsState> {
  final PartnerSettingsRepository _repository;

  PartnerSettingsBloc(this._repository) : super(const PartnerSettingsInitial()) {
    on<PartnerSettingsEvent>(
      (event, emit) => switch (event) {
        StartedEventPartnerSettings() => _startedEventPartnerSettings(event, emit),
      },
    );
  }

  Future<void> _startedEventPartnerSettings(
    StartedEventPartnerSettings event,
    Emitter<PartnerSettingsState> emit,
  ) async {
    try {
      emit(const PartnerSettingsLoading());
      if (event.linkEmail != null && event.linkEmail != event.user.email) {
        await _repository.boundAccounts(event.linkEmail!, event.user.email);
        emit(PartnerSettingsLoaded(event.linkEmail));
      } else {
        emit(PartnerSettingsLoaded(event.user.partnerEmail));
      }
    } catch (e) {
      emit(const PartnerSettingsError());
    }
  }
}
