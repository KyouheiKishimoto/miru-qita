import 'package:miru_qita/models/db/dao/freeword_dao.dart';
import 'package:miru_qita/models/db/dao/user_dao.dart';
import 'package:miru_qita/models/db/qita_local_database.dart';
import 'package:miru_qita/models/networking/qita_api_service.dart';
import 'package:miru_qita/models/repository/qita_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/**
 * 依存関係のあるクラスを宣言
 */
List<SingleChildWidget> dependentModels = [
  ProxyProvider<QitaLocalDatabase, UserDao>(
    update: (_, db, dao) => UserDao(db),
  ),
  ProxyProvider<QitaLocalDatabase, FreeWordDao>(
    update: (_, db, dao) => FreeWordDao(db),
  ),
  ChangeNotifierProvider<QitaRepository>(
    create: (context) => QitaRepository(
      userDao: Provider.of<UserDao>(context, listen: false),
      freeWordDao: Provider.of<FreeWordDao>(context, listen: false),
      qitaApiService: Provider.of<QitaApiService>(context, listen: false),
    ),
  ),
];