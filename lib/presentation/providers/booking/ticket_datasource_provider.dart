import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/infrastructure/datasources/APITuCine/ticket_datasource.dart';

final ticketDatasourceProvider = Provider<TicketDatasource>((ref) {
  return TicketDatasource();
});
