import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/feature/user/model/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> with BlocLoggy {
  final User? user;

  UserCubit({required this.user}) : super(const UserInitial()) {
    emit(UserLoaded(user: user));
  }
}
