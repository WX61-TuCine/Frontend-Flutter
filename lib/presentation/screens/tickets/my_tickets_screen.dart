import 'package:flutter/material.dart';

import 'movie_info_element.dart';

class MyTicketsScreen extends StatefulWidget {
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
        title: const Text('Mis Tikets'),
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
                    decoration: const BoxDecoration(color: Colors.orangeAccent),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      title: Text(movieTiket.name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      subtitle: Text(movieTiket.state, style: const TextStyle(color: Colors.black12, fontWeight: FontWeight.bold),),
                    ),
                  ),
                );
          }),)
        ],
      ),
    );
  }
}
