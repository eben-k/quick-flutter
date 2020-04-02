import 'dart:convert';
import 'package:http/http.dart' as http;

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

var crypto;
var value;

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map coinMap = (Map.fromIterable(cryptoList, key: crypto, value: value));
    for(String cryptoCurrency in cryptoList) {
      String requestURL = '$coinAPIURL/$cryptoCurrency/$selectedCurrency?apiKey=$apiKey';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['rate'];
        coinMap.updateAll((crypto, value) => value = lastPrice);
        return coinMap;

      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }

  }
}

