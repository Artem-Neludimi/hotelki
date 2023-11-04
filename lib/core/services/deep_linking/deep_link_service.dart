import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:uni_links/uni_links.dart';

import '../base_init_service.dart';

abstract class DeepLinkService implements BaseInitService {
  Future<void> onInitialUri();
  Future<void> dispose();
}

class DeepLinkServiceImpl with ServiceLoggy implements DeepLinkService {
  final GoRouter _router;

  DeepLinkServiceImpl(this._router);

  StreamSubscription<Uri?>? _deepLinkSubscription;

  Uri? _initialUri;

  @override
  Future<void> init() async {
    _initSubscription();
    _initialUri = await getInitialUri();
    loggy.info('initial uri: $_initialUri');
  }

  @override
  Future<void> onInitialUri() async {
    if (_initialUri != null) {
      loggy.info("run runInitialDeepLink $_initialUri");
      //  _router.go(_initialUri!.);
      _initialUri = null;
    } else {
      loggy.error("no initial uri");
    }
  }

  void _initSubscription() {
    _deepLinkSubscription = uriLinkStream.listen(_onDeepLinkListen);
    loggy.info("subscribed to deep links");
  }

  void _onDeepLinkListen(Uri? uri) async {
    loggy.info('got a new deep link - $uri');
    if (uri != null) {
      // await pushRouteFromUri(uri);
    }
  }

  @override
  Future<void> dispose() async {
    await _deepLinkSubscription?.cancel();
  }
}
