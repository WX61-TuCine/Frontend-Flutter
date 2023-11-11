import 'package:flutter/material.dart';
import 'tiket_view.dart';
import 'movie_info_element.dart';

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

  @override
  Widget build(BuildContext context) {
    final filterMovies = moviesList.where((movieTiket){
      return selectedStates.isEmpty || selectedStates.contains(movieTiket.state);
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
          Expanded(child: ListView.builder(
              itemCount:filterMovies.length,
              itemBuilder: (context, index){
                final movieTiket = filterMovies[index];
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
                          title: Text(movieTiket.name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          subtitle: Text(movieTiket.state, style: const TextStyle(color: Colors.black12, fontWeight: FontWeight.bold),),
                          trailing: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(30),
                              child: Image.network(movieTiket.img, fit: BoxFit.cover,),
                            )
                          ),
                          onTap: (){
                            Navigator.push(context, 
                                MaterialPageRoute(
                                    builder: (BuildContext context)=>TiketView(movieTiket)));
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
                                Text(movieTiket.address,
                                style: TextStyle(
                                  color: Colors.black54),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 5),
                                Text(movieTiket.nameCine, style: TextStyle(
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
          }),)
        ],
      ),
    );
  }
}
