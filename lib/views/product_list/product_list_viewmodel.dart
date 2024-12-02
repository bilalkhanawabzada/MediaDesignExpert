import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jaat_app/core/locator.dart';
import 'package:jaat_app/core/logger.dart';
import 'package:jaat_app/core/navigator_service.dart';
import 'package:jaat_app/core/router_constants.dart';
import 'package:jaat_app/core/services/product_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

/// ViewModel to manage the logic for the ProductListView.
///
/// This class handles product rows, dynamic focus nodes, notes, images,
/// and integration with services such as navigation and product suggestions.
class ProductListViewModel extends BaseViewModel {
  /// Logger instance for debugging and application events.
  late final Logger log;

  /// Navigator service for managing screen transitions.
  final NavigatorService _nav = locator<NavigatorService>();

  /// Product service for fetching product data and storing submitted orders.
  final ProductService _productService = locator<ProductService>();

  /// Tracks the current `BuildContext` for UI-related operations.
  BuildContext? _context;
  BuildContext? get context => _context;
  set context(BuildContext? value) {
    _context = value;
    notifyListeners();
  }

  /// Loading state for asynchronous operations.
  bool _isLoading = false;
  bool get loading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// List of product rows with `name` and `quantity` fields.
  final List<Map<String, dynamic>> productRows = [];

  /// List of focus nodes for dynamic text field focus management.
  final List<FocusNode> focusNodes = [];

  /// Picker instance for image selection.
  final ImagePicker _picker = ImagePicker();

  /// Stores file paths of images associated with product rows.
  final List<String?> images = [];

  /// Stores notes associated with product rows.
  final List<String?> notes = [];

  /// Constructor to initialize the logger and focus nodes for default rows.
  ProductListViewModel() {
    log = getLogger('ProductListViewModel');
    for (int i = 0; i < productRows.length; i++) {
      focusNodes.add(FocusNode());
    }
  }

   // Check for first empty row
  int? getFirstEmptyRowIndex() {
    for (int i = 0; i < productRows.length; i++) {
      if (productRows[i]['name']?.isEmpty ?? true && productRows[i]['quantity']?.isEmpty ?? true) {
        return i;
      }
    }
    return null;
  }

  bool get isButtonEnabled => productRows.any((row) => row['name']?.isNotEmpty == true && row['quantity']?.isNotEmpty == true);

  // Add a new row
  void addNewRow() {
    productRows.add({'quantity': '', 'name': ''});
    focusNodes.add(FocusNode());
    notifyListeners();
  }

  /// Clears all product rows and resets the state.
  void clearTable() {
    productRows.clear();
    focusNodes.clear();
    images.clear();
    notes.clear();
    notifyListeners();
  }

  /// Submits the current table by storing it in the product service and ignore the
  ///  empty row and the row which has missinng any quanntity or name of product
  /// and navigating to the order details route.
void submitTable() {
  // Filter rows that have both name and quantity filled
  final validRows = productRows.where((row) {
    final name = row['name']?.trim() ?? '';
    final quantity = row['quantity']?.trim() ?? '';
    return name.isNotEmpty && quantity.isNotEmpty;
  }).toList();

  if (validRows.isEmpty) {
    log.w('No valid rows to submit. All rows are either empty or incomplete.');
    return;
  }

  // Assign the filtered rows to the submitted order
  _productService.submittedOrder = validRows;

  // Log the submitted order
  log.i('Submitted order: ${_productService.submittedOrder}');

  // Navigate to the order details route
  _nav.pushNamed(orderDetailsRoute);
}


  /// Updates the product name at a specific index.
  void updateProductName(int index, String name) {
    if (index < productRows.length) {
      productRows[index]['name'] = name;
      notifyListeners();
    }
  }

  /// Updates the quantity at a specific index.
  void updateQuantity(int index, String quantity) {
    if (index < productRows.length) {
      productRows[index]['quantity'] = quantity;
      notifyListeners();
    }
  }


  // Fetch product suggestions
Future<List<String>> fetchProductSuggestions(String query) async {
  var allProducts = await _productService.fetchProductSuggestions(query);

  // Filter the products based on the query
  var filteredProducts = allProducts
      .where((product) => product.toLowerCase().contains(query.toLowerCase()))
      .toList();

  // Log the filtered suggestions
  log.i('Filtered suggestions for query "$query": $filteredProducts');

  return filteredProducts;
}



  // Notes Implementationn

  Future<String?> selectImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      return pickedFile?.path;
    } catch (e) {
      log.e("Error picking image: $e");
      return null;
    }
  }

  /// Updates the image for a specific row.
  void updateImage(int index, String imagePath) {
    if (index >= images.length) {
      images.add(imagePath);
    } else {
      images[index] = imagePath;
    }
    notifyListeners();
  }

  /// Retrieves the image path for a specific row.
  String? getImage(int index) {
    return index < images.length ? images[index] : null;
  }

  /// Updates the notes for a specific row.
  void updateNotes(int index, String note) {
    if (index >= notes.length) {
      notes.add(note);
    } else {
      notes[index] = note;
    }
    notifyListeners();
  }

  /// Retrieves the notes for a specific row.
  String? getNotes(int index) {
    return index < notes.length ? notes[index] : null;
  }

  /// Navigates back to the previous screen.
  void goBack() {
    _nav.pop();
  }
}

