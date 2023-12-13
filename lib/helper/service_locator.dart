import 'package:appwrite/appwrite.dart';
import 'package:get_it/get_it.dart';

import '../constants.dart';
import 'cache_helper.dart';

final getIt = GetIt.instance;

void setupSharedPrefrences() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}

void setupAppwrite() {
  getIt.registerSingleton<Client>(
    Client()
        .setEndpoint(baseUrl) //
        .setProject(projectId),
  );
  getIt.registerSingleton<Account>(Account(getIt.get<Client>()));
  getIt.registerSingleton<Databases>(Databases(getIt.get<Client>()));
}
