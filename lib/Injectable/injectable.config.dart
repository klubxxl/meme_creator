// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../Data/auth/data_sources/auth_login_api_data_source.dart' as _i4;
import '../Data/auth/data_sources/auth_register_api_data_source.dart' as _i5;
import '../Data/auth/mapper/auth_dto_to_auth_mapper.dart' as _i3;
import '../Data/auth/repository/auth_repository_impl.dart' as _i7;
import '../Domain/auth/repository/auth_repository.dart' as _i6;
import '../Domain/usecase/auth/sign_in_usecase.dart' as _i8;
import '../Domain/usecase/auth/sign_up_usecase.dart' as _i9;
import '../Presentation/Pages/login/bloc/login_bloc.dart' as _i10;
import '../Presentation/Pages/registration/bloc/registration_bloc.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthDtoToAuthMapper>(() => _i3.AuthDtoToAuthMapper());
  gh.factory<_i4.LoginApiDataSource>(() => _i4.LoginApiDataSource());
  gh.factory<_i5.RegisterApiDataSource>(() => _i5.RegisterApiDataSource());
  gh.singleton<_i6.AuthRepository>(_i7.AuthRepositoryImpl(
      get<_i5.RegisterApiDataSource>(),
      get<_i3.AuthDtoToAuthMapper>(),
      get<_i4.LoginApiDataSource>()));
  gh.factory<_i8.SignInUsecase>(
      () => _i8.SignInUsecase(get<_i6.AuthRepository>()));
  gh.factory<_i9.SignUpUsecase>(
      () => _i9.SignUpUsecase(get<_i6.AuthRepository>()));
  gh.factory<_i10.LoginBloc>(() => _i10.LoginBloc(get<_i8.SignInUsecase>()));
  gh.factory<_i11.RegistrationBloc>(
      () => _i11.RegistrationBloc(get<_i9.SignUpUsecase>()));
  return get;
}
