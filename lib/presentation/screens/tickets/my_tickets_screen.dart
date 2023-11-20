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
  List lAvailableFilms = [];

  Future<String> makeRequest() async{
    var responseT = await http.get(Uri.parse(provisionalUrl),
    headers: {'Accept': 'application/json'});

    setState(() {
      var extractData = json.decode(responseT.body);
      allTickets = List<Ticket>.from(extractData.map((dynamic item)=> Ticket.fromJson(item)));
    });

    //print(responseT.body);

    return responseT.body;

  }

  @override
  void initState(){
    super.initState();
    this.makeRequest();
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
                            title: Text(
                              (allTickets[i].user.firstName),
                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            subtitle: Text(movieTicket.state, style: const TextStyle(color: Colors.black12, fontWeight: FontWeight.bold),),
                            trailing: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(30),
                                  child: Image.network('https://images.pexels.com/photos/19110740/pexels-photo-19110740/free-photo-of-ciudad-puesta-de-sol-moda-hombre.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', fit: BoxFit.cover,),
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
                                  Icon(Icons.location_on_outlined,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    (movieTicket.dateEmition).toString(),
                                    style: TextStyle(
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Text(
                                    (movieTicket.showtime.unitPrice).toString(),
                                    style: TextStyle(
                                        color: Colors.black54
                                    ),)
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
