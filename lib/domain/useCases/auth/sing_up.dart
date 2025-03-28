import 'package:dartz/dartz.dart';
import 'package:shopy_app/core/configs/usecases/use_case.dart';
import 'package:shopy_app/core/service/service_lecator.dart';
import 'package:shopy_app/data/model/auth/create_user_rep.dart';
import 'package:shopy_app/domain/repo/auth/auth_repo.dart';

class SignUpUseCase implements UseCase<Either, CreateUserRep> {
  @override
  Future<Either> call({CreateUserRep? params}) async {
    return serviceLecator<AuthRepo>().signUp(params!);
  }
}
