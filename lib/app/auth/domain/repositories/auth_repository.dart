import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/app/auth/domain/entities/logger_user.dart';
import 'package:flutter_clean_arch/app/auth/domain/errors/auth_exception.dart';
import 'package:flutter_clean_arch/app/auth/domain/use_cases/login_usecase.dart';

abstract class AuthRepository {
  Future<Either<AuthExeption, LoggerUser>> login(CredentialParams params);
}