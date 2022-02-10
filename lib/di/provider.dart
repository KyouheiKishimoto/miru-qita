import 'package:miru_qita/di/view_models.dart';
import 'package:provider/single_child_widget.dart';
import 'dependent_models.dart';
import 'independent_models.dart';

/**
 * MultiProviderを宣言
 */
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

