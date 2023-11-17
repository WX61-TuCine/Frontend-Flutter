import 'package:dio/dio.dart';
import 'package:tu_cine/domain/datasources/APITuCine/cineclubs_datasource.dart';
import 'package:tu_cine/domain/entities/cineclub.dart';
import 'package:tu_cine/infrastructure/mappers/APITuCine/cineclub_mapper.dart';
import 'package:tu_cine/infrastructure/models/apiTuCine/cineclub_response.dart';

class CineclubDatasource extends CineclubsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://backend-production-733a.up.railway.app/api/TuCine/v1',
  ));

  List<Cineclub> _jsonToCineclubs(List<dynamic> json) {
    final List<Cineclub> cineclubs = json.map((data) {
      final cineclubResponse = CineclubResponse.fromJson(data);
      return CineclubMapper.cineclubToEntity(cineclubResponse);
    }).toList();

    return cineclubs;
  }

  @override
  Future<List<Cineclub>> getCineclubs() async {
    final response = await dio.get('/businesses');

    return _jsonToCineclubs(response.data);
  }
  
  @override
  Future<Cineclub> getCineclubById(String id) async {
    final response = await dio.get('/businesses/$id');
    if (response.statusCode != 200) throw Exception('Error al obtener el cineclub');

    final cineclubDetails = CineclubResponse.fromJson(response.data);

    final Cineclub cineclub = CineclubMapper.cineclubToEntity(cineclubDetails);

    return cineclub;
  }
}
