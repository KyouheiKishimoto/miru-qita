import 'package:miru_qita/models/repository/qita_repository.dart';
import 'package:miru_qita/viewmodels/details_viewmodels.dart';
import 'package:miru_qita/viewmodels/home_viewmodels.dart';
import 'package:miru_qita/viewmodels/search_viewmodels.dart';
import 'package:miru_qita/viewmodels/user_info_viewmodels.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/**
 * ViewMoelの宣言
 */
List<SingleChildWidget> viewModels = [
  ChangeNotifierProxyProvider<QitaRepository, HomeViewModel>(
    create: (context) => HomeViewModel(
      qitaRepository: Provider.of<QitaRepository>(context, listen: false),
    ),
    update: (context, repository, viewModel) =>
        viewModel!..onRepositoryUpdated(repository),
  ),
  ChangeNotifierProxyProvider<QitaRepository, DetailsViewModel>(
    create: (context) => DetailsViewModel(
      qitaRepository: Provider.of<QitaRepository>(context, listen: false),
    ),
    update: (context, repository, viewModel) =>
    viewModel!..onRepositoryUpdated(repository),
  ),
  ChangeNotifierProxyProvider<QitaRepository, SearchViewModel>(
    create: (context) => SearchViewModel(
      qitaRepository: Provider.of<QitaRepository>(context, listen: false),
    ),
    update: (context, repository, viewModel) =>
    viewModel!..onRepositoryUpdated(repository),
  ),
  ChangeNotifierProxyProvider<QitaRepository, UserInfoViewModel>(
    create: (context) => UserInfoViewModel(
      qitaRepository: Provider.of<QitaRepository>(context, listen: false),
    ),
    update: (context, repository, viewModel) =>
    viewModel!..onRepositoryUpdated(repository),
  ),
];
