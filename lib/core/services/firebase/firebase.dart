import 'package:firebase_core/firebase_core.dart';
import 'package:scalable_flutter_app_starter/core/services/base_init_service.dart';

import '../../../firebase_options.dart';

abstract interface class FirebaseService implements BaseInitService {}

class FirebaseServiceImpl implements FirebaseService {
  @override
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
