import 'package:flutter_clean_arch/app/auth/domain/errors/auth_exception.dart';
import 'package:flutter_clean_arch/app/auth/domain/entities/logger_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/app/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_arch/app/auth/domain/use_cases/login_usecase.dart';
import 'package:flutter_clean_arch/app/auth/infra/datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<AuthExeption, LoggerUser>> login(
      CredentialParams params) async {
    try {
      var user = await datasource.login(params);
      return Right(user);
    } on AuthExeption catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(AuthExeption('Exception: $e'));
    }
  }
}
