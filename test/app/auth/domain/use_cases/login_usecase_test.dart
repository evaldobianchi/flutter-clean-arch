import 'package:flutter_clean_arch/app/auth/domain/errors/auth_exception.dart';
import 'package:flutter_clean_arch/app/auth/domain/entities/logger_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/app/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_arch/app/auth/domain/use_cases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<Either<AuthExeption, LoggerUser>> login(
      CredentialParams params) async {
    if (params.password == '1234') {
      return Left(AuthExeption('Erro Senha Fraca'));
    }

    return Right(LoggerUser(email: params.email, name: 'Evaldo'));
  }
}

void main() {
  final repository = AuthRepositoryMock();
  final usecase = LoginUsecase(repository);
  testWidgets('login usecase com sucesso', (tester) async {
    var params =
        CredentialParams(email: 'bianchievaldo@gmail.com', password: '123');
    var result = await usecase(params);

    expect(result.isRight(), isTrue);
    expect(result.getOrElse(() => LoggerUser(email: '', name: '')).name, equals('Evaldo'));
  });
}
