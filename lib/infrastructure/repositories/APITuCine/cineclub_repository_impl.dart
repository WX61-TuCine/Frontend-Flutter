import 'package:tu_cine/domain/datasources/APITuCine/cineclubs_datasource.dart';
import 'package:tu_cine/domain/entities/cineclub.dart';
import 'package:tu_cine/domain/repositories/APITuCine/cineclubs_repository.dart';

class CineclubRepositoryImpl extends CineclubsRepository{

  final CineclubsDatasource dataSource;
  CineclubRepositoryImpl(this.dataSource);

  @override
  Future<List<Cineclub>> getCineclubs() {
    return dataSource.getCineclubs();
  }
  
  @override
  Future<Cineclub> getCineclubById(String id) {
    return dataSource.getCineclubById(id);
  }
}