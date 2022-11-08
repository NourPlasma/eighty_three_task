import 'package:dio/dio.dart';
import 'network_config.dart';

class ApiController {
  NetworkConfig? _networkConfig;

  ApiController() {
    _networkConfig = NetworkConfig();
  }

  onClearCash() {
    _networkConfig!.clearCacheOptions();
  }

  //  Grocery
  Future<String> onLoadGrocery() {
    return _networkConfig!
        .getAssets(url: 'assets/mock_json/grocery.json');
  }
}
