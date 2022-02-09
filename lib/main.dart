import 'package:flutter_clean_arch/app/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_arch/app/auth/domain/use_cases/login_usecase.dart';
import 'package:flutter_clean_arch/app/auth/externals/firebase/firebase_auth_datasource.dart';
import 'package:flutter_clean_arch/app/auth/infra/repositories/auth_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'app/auth/infra/datasources/auth_datasource.dart';

GetIt getIt = GetIt.instance;
void main() {
  setUp();

  LoginUsecase login = getIt<LoginUsecase>();

  login(CredentialParams(email: 'bianchievaldo@gmail.com', password: '1234'))
      .then((value) =>
          value.fold((l) => print(l.message), (r) => print(r.email)));
}

void setUp() {
  getIt.registerSingleton<AuthDatasource>(FirebaseAuthDatasource());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(getIt.get()));
  getIt.registerSingleton(LoginUsecase(getIt.get()));
}
