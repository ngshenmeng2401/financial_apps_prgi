import 'package:financial_apps_prgi/model/currency_model.dart';
import 'package:financial_apps_prgi/model/currency_rate_model.dart';
import 'package:http/http.dart' as http;

class CurrencyRemoteServices{

  static var client = http.Client();

  static Future<Map> fetchCurrencyList() async {

    var response =
      await client.get(
        Uri.parse(
          "https://openexchangerates.org/api/currencies.json?app_id=0ea256616dc84988a13f04c2283cf3f5"),);
      if (response.statusCode == 200) {
        
        var jsonString = response.body;
        return currencyFromJson(jsonString);
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<CurrencyRate> fetchCurrencyRateList() async {

    var response =
      await client.get(
        Uri.parse(
          "https://openexchangerates.org/api/latest.json?app_id=0ea256616dc84988a13f04c2283cf3f5"),);
      if (response.statusCode == 200) {
        
        var jsonString = response.body;
        // print(jsonString);
        return currencyRateFromJson(jsonString);
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }
}