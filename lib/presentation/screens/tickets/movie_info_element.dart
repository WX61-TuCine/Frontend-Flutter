class MovieTiket {
  final String name;
  final String nameCine;
  final String state;
  final String address;
  MovieTiket({
    required this.name,
    required this.nameCine,
    required this.state,
    required this.address
});
}

final List<MovieTiket> moviesList = [
  MovieTiket(name: 'El gato con botas el ultimo deseo', nameCine: 'AUTOCINE LIMAPARK', state: 'pasado', address: 'San Miguel 15088'),
  MovieTiket(name: 'Todo en todas partes', nameCine: 'CINECAFE CINE & CINE', state: 'pasado', address: 'Puerto Boyaca 155201'),
  MovieTiket(name: 'FIVE NIGHTS AT FREDDYS', nameCine: 'CINECLUB COSTALIRA', state: 'proximo', address: 'Av. Los Mares'),
  MovieTiket(name: 'Duna parte 2', nameCine: 'CINECLUB COSTALIRA', state: 'proximo', address: 'Av. Los Mares'),
  MovieTiket(name: 'Juega o Muere', nameCine: 'CINECLUB COSTALIRA', state: 'cancelado', address: 'Av. Los Mares')
];
