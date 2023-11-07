import 'package:tu_cine/domain/datasources/cineclubs_datasource.dart';
import 'package:tu_cine/domain/entities/cineclub.dart';
import 'package:tu_cine/domain/repositories/cineclubs_repository.dart';

class CineclubRepositoryImpl extends CineclubsRepository{

  final CineclubsDatasource dataSource;
  CineclubRepositoryImpl(this.dataSource);

  @override
  Future<List<Cineclub>> getCineclubs() {
    return dataSource.getCineclubs();
  }
}