// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/auth/data_sources/auth_login_api_data_source.dart' as _i5;
import '../data/auth/data_sources/auth_register_api_data_source.dart' as _i6;
import '../data/auth/mapper/auth_dto_to_auth_mapper.dart' as _i3;
import '../data/auth/repository/auth_repository_impl.dart' as _i4;
import '../domain/usecase/auth/sign_in_usecase.dart' as _i7;
import '../domain/usecase/auth/sign_up_usecase.dart' as _i8;
import '../presentation/pages/login/bloc/login_bloc.dart' as _i9;
import '../presentation/pages/registration/bloc/registration_bloc.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthDtoToAuthMapper>(() => _i3.AuthDtoToAuthMapper());
  gh.singleton<_i4.AuthRepositoryImpl>(
      _i4.AuthRepositoryImpl(get<dynamic>(), get<dynamic>(), get<dynamic>()));
  gh.factory<_i5.LoginApiDataSource>(() => _i5.LoginApiDataSource());
  gh.factory<_i6.RegisterApiDataSource>(() => _i6.RegisterApiDataSource());
  gh.factory<_i7.SignInUsecase>(() => _i7.SignInUsecase(get<dynamic>()));
  gh.factory<_i8.SignUpUsecase>(() => _i8.SignUpUsecase(get<dynamic>()));
  gh.factory<_i9.LoginBloc>(() => _i9.LoginBloc(get<_i7.SignInUsecase>()));
  gh.factory<_i10.RegistrationBloc>(
      () => _i10.RegistrationBloc(get<_i8.SignUpUsecase>()));
  return get;
}
