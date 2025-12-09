import 'package:fruit/core/repos/product_repo/product_repo.dart';
import 'package:fruit/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruit/core/services/data_base.dart';
import 'package:fruit/core/services/firebase_auth_services.dart';
import 'package:fruit/core/services/firebase_store_sevices.dart';
import 'package:fruit/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit/features/auth/demain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());

  getIt.registerSingleton<DataBaseServices>(FirebaseStoreServices());

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthServices: getIt<FirebaseAuthServices>(),
    firebaseStoreServices: getIt<DataBaseServices>(),
  ));
  getIt.registerSingleton<ProductRepo>(
      ProductRepoImpl(getIt<DataBaseServices>()));
}
