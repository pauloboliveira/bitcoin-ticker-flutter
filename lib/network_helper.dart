import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'apikey';

class NetworkHelper {

  Future<dynamic> getRate(String currency, String coin) async {

    Uri url = Uri.https('rest.coinapi.io', '/v1/exchangerate/$coin/$currency', {'apikey' : apiKey});

    http.Response response = await http.get(url);

    if(response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print('Erro na chamada');
    }
  }
}