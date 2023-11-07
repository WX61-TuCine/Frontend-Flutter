import 'package:tu_cine/domain/entities/cineclub.dart';

abstract class CineclubsRepository{
  Future<List<Cineclub>> getCineclubs();
}