import 'package:fruit/core/services/firebase_auth_services.dart';
import 'package:fruit/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit/features/auth/demain/repos/auth_repo.dart';
import 'package:fruit/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {

  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthServices: getIt<FirebaseAuthServices>(),
  ));


}