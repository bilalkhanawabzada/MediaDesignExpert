// import 'package:connectivity_plus/connectivity_plus.dart';

// ignore_for_file: avoid_print

import '../base/base_service.dart';

// /// [connectionState] returns true if device is connected to wifi or mobile data

// class ConnectivityServices extends BaseService{

//   Future<bool> connectionState() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if(connectivityResult == ConnectivityResult.mobile){
//       return true;
//     }else if(connectivityResult == ConnectivityResult.wifi){
//       return true;
//     }else{
//       return false;
//     }

//   }

// }

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'base_service.dart';

class ConnectivityServices extends BaseService {
  Future<bool> connectionState() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print('Connectivity result: $connectivityResult');

    // Check if the device is connected to a network (Wi-Fi or Mobile)
    if (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi)) {
      // Now check for actual internet access
      bool hasInternet = await InternetConnectionChecker().hasConnection;
      print('Has internet access: $hasInternet');
      return hasInternet;
    } else {
      print('No connectivity');
      return false;
    }
  }
}
