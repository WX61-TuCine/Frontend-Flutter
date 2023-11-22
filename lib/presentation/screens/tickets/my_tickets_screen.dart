import 'package:flutter/material.dart';
import 'tiket_view.dart';
import 'movie_info_element.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyTicketsScreen extends StatefulWidget {
  static const routeName = 'my_tickets_screen';
  const MyTicketsScreen({super.key});

  
  @override
  State<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {

  final List<String> states = [
    'pasado',
    'proximo',
    'cancelado'
  ];
  List<String> selectedStates = [];

  String provisionalUrl = "https://backend-production-733a.up.railway.app/api/TuCine/v1/tickets";
  List<Ticket> allTickets = [];
  List<AvailableFilm> allAvFilms = [];
  List<Showtime> allShowtimes = [];

  

  Future<String> makeRequest() async{
    var responseT = await http.get(Uri.parse(provisionalUrl),
    headers: {'Accept': 'application/json'});

    setState(() {
      var extractData = json.decode(responseT.body);
      allTickets = List<Ticket>.from(extractData.map((dynamic item)=> Ticket.fromJson(item)));
    });
    return responseT.body;
  }

  Future<String> makeRequestShowTimes() async{
    var responseS = await http.get(Uri.parse('https://backend-production-733a.up.railway.app/api/TuCine/v1/showtimes'),
        headers: {'Accept': 'application/json'});

    setState(() {
      var extractDataS = json.decode(responseS.body);
      allShowtimes = List<Showtime>.from(extractDataS.map((dynamic item)=> Showtime.fromJson(item)));
    });
    return responseS.body;
  }

  Future<String> makeRequestAvailableFilms() async{
    var responseA = await http.get(Uri.parse("https://backend-production-733a.up.railway.app/api/TuCine/v1/availableFilms"),
        headers: {'Accept': 'application/json'});

    setState(() {
      var extractData = json.decode(responseA.body);
      allAvFilms = List<AvailableFilm>.from(extractData.map((dynamic item)=> AvailableFilm.fromJson(item)));
    });
    return responseA.body;
  }

  
  AvailableFilm getAvFilmById(int id) {
    AvailableFilm thisAvFilm = allAvFilms
        .firstWhere((avFilm) => avFilm.id == id);

    return thisAvFilm;
  }
  Showtime getShowtimeById(int id) {
    Showtime thisShowtime = allShowtimes
        .firstWhere((element) => element.id == id);
    return thisShowtime;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await makeRequest();
    await makeRequestAvailableFilms();
    await makeRequestShowTimes();
  }

  
  @override
  Widget build(BuildContext context) {
    final filterMovies = allTickets.where((movieTicket){
      return selectedStates.isEmpty || selectedStates.contains(movieTicket.state);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Tickets'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: states
                  .map(
                    (state) => FilterChip(
                        label: Text(state),
                        selected: selectedStates.contains(state),
                        onSelected: (selected){
                          setState(() {
                            if(selected){
                              selectedStates.add(state);
                            }else{
                              selectedStates.remove(state);
                            }
                          });
                        }),
              ).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allTickets == null ? 0 : allTickets.length,
              itemBuilder: (context, i){
                if(i >= 0 && i < allTickets.length && i < filterMovies.length){
                  final movieTicket = filterMovies[i];
                  return Card(
                    elevation: 8.0,
                    margin: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            title: (allAvFilms.isNotEmpty && allShowtimes.isNotEmpty) ?
                            Text(
                                (getAvFilmById(getShowtimeById(movieTicket.showtimeId).availableFilmId)).film.title,
                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)): Text("Cargado..."),
                            subtitle: Text(movieTicket.state, style: const TextStyle(color: Colors.black12, fontWeight: FontWeight.bold),),
                            trailing: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30),
                                    child: (allAvFilms.isNotEmpty && allShowtimes.isNotEmpty) ? Image.network((getAvFilmById(getShowtimeById(movieTicket.showtimeId).availableFilmId)).film.posterSrc, fit: BoxFit.cover) : Container(),
                                )
                            ),
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context)=>TiketView(movieTicket)));
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.location_on_outlined,
                                    color: Colors.black54,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    (movieTicket.dateEmition).toString(),
                                    style: const TextStyle(
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                              Row(
                                
                                children: [
                                  const SizedBox(width: 5),
                                  Text(
                                    (movieTicket.showtimeId).toString(),
                                    style: const TextStyle(
                                        color: Colors.black54)
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),

                    ),
                  );
                }
          })
            ,)
        ],
      ),
    );
  }
}
