
import 'package:jaat_app/core/locator.dart';
import 'package:jaat_app/core/logger.dart';
import 'package:jaat_app/core/navigator_service.dart';
import 'package:jaat_app/core/services/product_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

/// ViewModel responsible for managing the logic and state of the `OrderDetailsView`.
/// This includes managing product rows, handling loading state, and interacting with services.
class OrderDetailsViewModel extends BaseViewModel {
  // Logger instance for logging relevant information.
  Logger? log;
  
  // Navigator service for navigating between views.
  final _nav = locator<NavigatorService>();
  
  // Product service for interacting with product-related data and API.
  final _productService = locator<ProductService>();

  // Holds the order details fetched from the product service.
  List<Map<String, dynamic>>? orderDetails;

  // Constructor initializes the order details and logger.
  OrderDetailsViewModel() {
    // Fetch order details from the product service and assign it.
    orderDetails = _productService.submittedOrder;
    // Initialize logger with the ViewModel's class name.
    log = getLogger(runtimeType.toString());
  }

  /// Navigates back to the previous screen using the navigator service.
  /// This method is called when the user presses the back button.
  goBack() {
    // Pop the current screen from the navigation stack.
    _nav.pop();
  }
}




// import 'package:flutter/material.dart';
// import 'package:jaat_app/core/locator.dart';
// import 'package:jaat_app/core/logger.dart';
// import 'package:jaat_app/core/navigator_service.dart';
// import 'package:jaat_app/core/services/product_service.dart';
// import 'package:logger/logger.dart';
// import 'package:stacked/stacked.dart';

// class OrderDetailsViewModel extends BaseViewModel {
//   Logger? log;
//   final _nav = locator<NavigatorService>();
//   final _productService = locator<ProductService>();

//   // final _connection = locator<ConnectivityServices>();

//   BuildContext? _context;
//   BuildContext? get context => _context;
//   set context(BuildContext? value) {
//     _context = value;
//     notifyListeners();
//   }

//   List<Map<String, dynamic>>? orderDetails;

//   bool _isLoading = false;
//   bool get loading => _isLoading;
//   setLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }

//   OrderDetailsViewModel() {
//     orderDetails = _productService.submittedOrder;
//     log = getLogger(runtimeType.toString());
//   }

//   List<Map<String, dynamic>> productRows = [];

//   bool get isButtonEnabled => productRows.any((row) => row['name']?.isNotEmpty == true && row['quantity']?.isNotEmpty == true);

//   // Add a new row
//   void addNewRow() {
//     productRows.add({'name': '', 'quantity': ''});
//     notifyListeners();
//   }

//   // Clear the table
//   void clearTable() {
//     productRows.clear();
//     notifyListeners();
//   }

//   // Submit the table
//   void submitTable() {
//     // Handle submission logic here
//     debugPrint('Submitted: $productRows');
//   }

//   // Update product name in a specific row
//   void updateProductName(int index, String name) {
//     productRows[index]['name'] = name;
//     notifyListeners();
//   }

//   // Update quantity in a specific row
//   void updateQuantity(int index, String quantity) {
//     productRows[index]['quantity'] = quantity;
//     notifyListeners();
//   }

//   // Fetch product suggestions
//   Future<List<String>> fetchProductSuggestions(String query) async {
//     var allProducts = await _productService.fetchProductSuggestions(query);
//     return allProducts.where((product) => product.toLowerCase().contains(query.toLowerCase())).toList();
//   }

//   goBack() {
//     _nav.pop();
//   }
// }
