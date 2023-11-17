class MovieTiket {
  final String name;
  final String nameCine;
  final String state;
  final String address;
  final String img;
  MovieTiket({
    required this.name,
    required this.nameCine,
    required this.state,
    required this.address,
    required this.img
});
}

final List<MovieTiket> moviesList = [
  MovieTiket(name: 'El gato con botas el ultimo deseo', nameCine: 'AUTOCINE LIMAPARK', state: 'pasado', address: 'San Miguel 15088', img: 'https://pics.filmaffinity.com/El_gato_con_botas_El_aultimo_deseo-528008999-large.jpg'),
  MovieTiket(name: 'Todo en todas partes', nameCine: 'CINECAFE CINE & CINE', state: 'pasado', address: 'Puerto Boyaca 155201', img: 'https://static.cinepolis.com/resources/mx/movies/posters/414x603/39349-622929-20230313021743.jpg'),
  MovieTiket(name: 'FIVE NIGHTS AT FREDDYS', nameCine: 'CINECLUB COSTALIRA', state: 'proximo', address: 'Av. Los Mares', img: 'https://static.wikia.nocookie.net/freddy-fazbears-pizza/images/d/d9/FNaF-_La_Pel%C3%ADcula_poster_ampliado_english.jpeg/revision/latest/scale-to-width/360?cb=20230614224839&path-prefix=es'),
  MovieTiket(name: 'Duna parte 2', nameCine: 'CINECLUB COSTALIRA', state: 'proximo', address: 'Av. Los Mares', img: 'https://static.wikia.nocookie.net/doblaje/images/7/7f/FvI0P8GWIAIuwEu.jpg/revision/latest?cb=20230503170936&path-prefix=es'),
  MovieTiket(name: 'Juega o Muere', nameCine: 'CINECLUB COSTALIRA', state: 'cancelado', address: 'Av. Los Mares', img: 'https://static.wikia.nocookie.net/doblaje/images/4/42/Juega_o_muere.jpg/revision/latest?cb=20211012010036&path-prefix=es')
];
