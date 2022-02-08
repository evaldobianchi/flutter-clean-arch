import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_clean_arch/app/auth/domain/entities/logger_user.dart';
import 'package:flutter_clean_arch/app/auth/domain/errors/auth_exception.dart';
import 'package:flutter_clean_arch/app/auth/domain/repositories/auth_repository.dart';

abstract class ILoginUsecase {
  Future<Either<AuthExeption, LoggerUser>> call(CredentialParams params);
}

class LoginUsecase implements ILoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<AuthExeption, LoggerUser>> call(CredentialParams params) async {
    if (!EmailValidator.validate(params.email)) {
      return Left(AuthExeption('Email invalido'));
    }
    if (params.password.isEmpty) {
      return Left(AuthExeption('Senha inválida'));
    }

    return await repository.login(params);
  }
}

class CredentialParams {
  final String email;
  final String password;

  CredentialParams({required this.email,required this.password});
}
