import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:web3shopping_app/clean_architech/features/data/ds_local/local_data_source.dart';
import 'package:web3shopping_app/clean_architech/features/data/ds_local/local_ds_impl.dart';
import 'package:web3shopping_app/clean_architech/features/domain/repositories/local_domain_repo.dart';
import 'package:web3shopping_app/clean_architech/features/domain/repositories/remote_domain_repo.dart';
import 'package:web3shopping_app/clean_architech/features/domain/usecases/uc_userauth.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/cubits/authorization/cubit_auth.dart';

import 'clean_architech/features/data/data_repo/local_data_repo_impl.dart';
import 'clean_architech/features/data/data_repo/remote_data_repo.dart';
import 'clean_architech/features/data/ds_remote/remote_data_source.dart';
import 'clean_architech/features/data/ds_remote/remote_ds_impl.dart';

//To know more please visitto information.txt
final sl = GetIt.instance;
Future<void> init() async {
  //::::::::::::::::::::CUBIT REGISTRATION:::::::::::::::::::::::::::::::
  registerCubits();
//::::::::::::::::::::::::USECASE REGISTRATION:::::::::::::::::::::::
  registerUseCases();

  //::::::::::::::::::::::::REPO REGISTER::::::::::::::::::

  sl.registerLazySingleton<LocalDomainRepository>(
      () => LocalDataRepoImpl(localDataSource: sl.call()));

  sl.registerLazySingleton<RemoteDomainRepository>(
      () => RemoteRepoImpl(remoteDataSource: sl.call()));

  //Remote  and local datasource
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(box: sl.call()));
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(box: sl.call(), dio: sl.call()));
  //External

  // File path to a file in the current directory
  await Hive.initFlutter();
  // Open the peopleBox
  final box = await Hive.openBox('webthreeapp');

  // final http.Client httpClient = http.Client();
  // sl.registerLazySingleton<http.Client>(() => httpClient);

  final dio = Dio()
    ..options.baseUrl = "https://offset7.com/api/"
    ..interceptors.add(LogInterceptor())
    ..httpClientAdapter = Http2Adapter(ConnectionManager(
      idleTimeout: const Duration(seconds: 15),
      onClientCreate: (_, config) => config.onBadCertificate = (_) => true,
    ));

  sl.registerLazySingleton(() => dio);
  //final localDB = await SharedPreferences.getInstance();

  //sl.registerLazySingleton(() => localDB);
  sl.registerLazySingleton(() => box);
}

void registerCubits() {
sl.registerFactory<CubitAuth>(() => CubitAuth(userAuthUseCase: sl.call()));
  
 }

void registerUseCases() {
  sl.registerLazySingleton<UseCaseUserAuth>(
      () => UseCaseUserAuth(localRepository: sl.call(),remoteRepository: sl.call()));

}