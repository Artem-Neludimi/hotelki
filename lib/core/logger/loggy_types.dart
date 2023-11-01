import 'package:loggy/loggy.dart';

mixin ModelLoggy implements LoggyType {
  @override
  Loggy<ModelLoggy> get loggy => Loggy<ModelLoggy>('MODEL: $runtimeType');
}

mixin UiLoggy implements LoggyType {
  @override
  Loggy<UiLoggy> get loggy => Loggy<UiLoggy>('UI: $runtimeType');
}

mixin BlocLoggy implements LoggyType {
  @override
  Loggy<BlocLoggy> get loggy => Loggy<BlocLoggy>('BLOC: $runtimeType');
}
mixin NotifierLoggy implements LoggyType {
  @override
  Loggy<BlocLoggy> get loggy => Loggy<BlocLoggy>('NOTIFIER: $runtimeType');
}

mixin RepositoryLoggy implements LoggyType {
  @override
  Loggy<RepositoryLoggy> get loggy => Loggy<RepositoryLoggy>('REPOSITORY: $runtimeType');
}

mixin ApiLoggy implements LoggyType {
  @override
  Loggy<ApiLoggy> get loggy => Loggy<ApiLoggy>('API: $runtimeType');
}
