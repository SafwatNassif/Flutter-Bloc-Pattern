import 'package:flutter/widgets.dart';

import 'json_bloc.dart';

class ProviderResponse extends InheritedWidget {
  final bloc = JsonBloc();

  ProviderResponse({Key key, Widget child}) : super(key: key, child: child);

  static JsonBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(ProviderResponse)
              as ProviderResponse)
          .bloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
