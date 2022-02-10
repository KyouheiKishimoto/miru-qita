import 'package:miru_qita/models/db/qita_local_database.dart';
import 'package:miru_qita/models/networking/qita_api_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';

/**
 * 依存関係のないクラス宣言
 */
List<SingleChildWidget> independentModels = [
  RouteObserverProvider(
    create: (context) => GlobalRouteObserver()..navigation.listen(print),
  ),
  Provider<QitaLocalDatabase>(
    create: (_) => QitaLocalDatabase(),
    dispose: (_, db) => db.close(),
  ),
  Provider<QitaApiService>(
    create: (_) => QitaApiService.create(),
  ),
];