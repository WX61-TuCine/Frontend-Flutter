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
                size: 20,
              ),
              Icon(
                Icons.more_vert,
                color: Colors.black87,
                size: 20,
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
              height: 500,
              isCornerRounded: true,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          const Text('Mostrar este ticket en la entrada.', style: TextStyle(fontSize: 14, color: Colors.black54,)),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(
                            thickness: 1,
                            height: 20,
                            color: Colors.black54,
                          ))
                          ,
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            title: Text("Cineclub", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),),
                            subtitle: Text("Autocine Limapark", style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),),
                            trailing: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(30),
                                  child: Image.network("https://www.catedrabergman.unam.mx/wp-content/uploads/2020/08/30739836_1746755055385974_3114962573733134336_o.jpg", fit: BoxFit.cover,),
                                )
                            )
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ticketDetails('Fecha', '17-09-2023'),
                                  ticketDetails('Horario', '13:00')
                                ]),
                              const SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ticketDetails('Dirección', 'San Miguel 54174'),
                                    ticketDetails('Cantidad', '1'),
                                  ]),
                              const SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ticketDetails('Precio total', 'S/ 15.25'),
                                    ticketDetails('Order Id', '112345678')
                                  ]),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 200,
                            color: Colors.white,
                            child: Image.network("https://d100mj7v0l85u5.cloudfront.net/s3fs-public/2022-10/futuro-codigo-de-barras.png", fit: BoxFit.cover,),
                          )
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

  Widget ticketDetails(String title, String details) => Column(
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
      Text(
        details,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      )
    ],
  );
}
