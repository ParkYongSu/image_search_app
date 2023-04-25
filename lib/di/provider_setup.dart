import 'package:dio/dio.dart';
import 'package:image_search_app/data/data_source/pixabay_api.dart';
import 'package:image_search_app/data/repository/photo_reposioty_impl.dart';
import 'package:image_search_app/domain/use_case/get_use_case.dart';
import 'package:image_search_app/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<Dio>(create: (context) => Dio()),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<Dio, PixabayApi>(
    update: (context, dio, _) => PixabayApi(dio: dio),
  ),
  ProxyProvider<PixabayApi, PhotoRepositoryImpl>(
    update: (context, api, _) => PhotoRepositoryImpl(api: api),
  ),
  ProxyProvider<PhotoRepositoryImpl, GetUseCase>(
    update: (context, repository, _) => GetUseCase(repository: repository),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider(
    create: (context) => HomeViewModel(useCase: context.read<GetUseCase>()),
  ),
];
