import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'C90F5808-5FDF-41A4-B771-075DCB84F5FA';

class CoinData {
  
  Future<dynamic> getCoinData() async {
  http.Response response = await http.get('$coinAPIURL/BTC/USD?apiKey=$apiKey');
  if(response.statusCode == 200) {
    String data = response.body;
    var decodedData = jsonDecode(data);
    return decodedData;
  } else {
    print(response.statusCode);
  }
}
}
