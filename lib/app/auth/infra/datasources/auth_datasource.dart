import 'package:flutter_clean_arch/app/auth/domain/entities/logger_user.dart';
import 'package:flutter_clean_arch/app/auth/domain/use_cases/login_usecase.dart';

abstract class AuthDatasource {
  Future<LoggerUser> login(CredentialParams params);
}
