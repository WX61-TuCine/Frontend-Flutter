import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TiketView extends StatelessWidget {
  TiketView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.black87,
                size: 40,
              ),
              Icon(
                Icons.more_vert,
                color: Colors.black87,
                size: 40,
              )
            ],
          ),
          Text(
            "Ver Tiket",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w200,
            ),
          ),
          TicketWidget(
            color: Colors.amberAccent,
              width: 300,
              height: 600,
              isCornerRounded: true,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Image.network(data.img, fit: BoxFit.cover,)
                          ),
                          Text(data.name,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          const Text('Mostrar este ticket en la entrada.', style: TextStyle(fontSize: 16, color: Colors.black54,)),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(
                            thickness: 1,
                            height: 20,
                            color: Colors.black54,
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
