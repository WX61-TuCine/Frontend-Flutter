import 'package:tu_cine/domain/entities/cineclub.dart';

abstract class CineclubsDatasource{
  Future<List<Cineclub>> getCineclubs();
}