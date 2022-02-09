import 'package:flutter_clean_arch/app/auth/domain/use_cases/login_usecase.dart';
import 'package:flutter_clean_arch/app/auth/domain/entities/logger_user.dart';
import 'package:flutter_clean_arch/app/auth/infra/datasources/auth_datasource.dart';

class FirebaseAuthDatasource implements AuthDatasource {
  @override
  Future<LoggerUser> login(CredentialParams params) async {
    return LoggerUser(email: params.email, name: 'Usuário autenticado');
  }
}
