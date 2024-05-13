// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:iqraa/bloc/feed_bloc.dart' as _i6;
import 'package:iqraa/repository/article_repository.dart' as _i3;
import 'package:iqraa/repository/category_repository.dart' as _i5;
import 'package:iqraa/repository/feed_repository.dart' as _i4;

const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final articleRepositoryFactory = _$ArticleRepositoryFactory();
    final feedRepositoryFactory = _$FeedRepositoryFactory();
    final categoryRepositoryFactory = _$CategoryRepositoryFactory();
    gh.lazySingleton<_i3.ArticleRepository>(
      () => articleRepositoryFactory.articleRepository,
      registerFor: {_dev},
    );
    gh.lazySingleton<_i4.FeedRepository>(
      () => feedRepositoryFactory.feedRepository,
      registerFor: {_dev},
    );
    gh.lazySingleton<_i5.CategoryRepository>(
      () => categoryRepositoryFactory.categoryRepository,
      registerFor: {_dev},
    );
    gh.factory<_i6.FeedBloc>(() => _i6.FeedBloc(gh<_i4.FeedRepository>()));
    return this;
  }
}

class _$ArticleRepositoryFactory extends _i3.ArticleRepositoryFactory {}

class _$FeedRepositoryFactory extends _i4.FeedRepositoryFactory {}

class _$CategoryRepositoryFactory extends _i5.CategoryRepositoryFactory {}
