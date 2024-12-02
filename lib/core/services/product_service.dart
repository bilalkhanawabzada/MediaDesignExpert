// import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jaat_app/core/base/base_service.dart';
import 'package:logger/logger.dart';

/// A service class to handle product-related API interactions.
class ProductService extends BaseService {
  /// Base URL of the API
  final String _apiUrl = 'https://app.giotheapp.com/api-sample/';

  /// HTTP client for making requests, injected for testability.
  final http.Client _httpClient;

  /// Logger instance for structured logging.
  final Logger _logger;

  /// Stores the list of orders submitted.
  List<Map<String, dynamic>>? submittedOrder;

  /// Constructor accepting dependencies via dependency injection.
  ProductService({http.Client? httpClient, Logger? logger})
      : _httpClient = httpClient ?? http.Client(),
        _logger = logger ?? Logger();

  /// Fetches product suggestions based on the provided query string.
  ///
  /// The function sends a GET request to the API and expects a JSON response.
  /// - If successful (HTTP 200), it parses the response and extracts product names.
  /// - If the response fails or an exception occurs, it logs the issue and returns an empty list.
  ///
  /// **Parameters**:
  /// - [query]: The search term used to fetch product suggestions.
  ///
  /// **Returns**:
  /// - A list of product names as strings, or an empty list if the operation fails.
  Future<List<String>> fetchProductSuggestions(String query) async {
    final Uri requestUri = Uri.parse('$_apiUrl?query=$query');
    try {
      _logger.d('Fetching product suggestions for query: $query');

      // Send GET request with a timeout.
      final response = await _httpClient
          .get(requestUri)
          .timeout(const Duration(seconds: 10));

      // Validate response status.
      if (response.statusCode == 200) {
        _logger.i('Received successful response for query: $query');

        // Decode the response body as a Map and extract product values.
        final Map<String, dynamic> products = json.decode(response.body);
        if (products.isEmpty) {
          _logger.w('No products found for query: $query');
        } else {
          _logger.i('Fetched suggestions: ${products.values}');
        }
        return products.values.map((value) => value.toString()).toList();
      } else if (response.statusCode == 500) {
        _logger.e('Internal Server Error while fetching suggestions.');
        return [];
      } else {
        _logger.w(
            'Failed to fetch suggestions. HTTP Status: ${response.statusCode}');
        return [];
      }
    } on TimeoutException catch (e) {
      _logger.e('Request timed out for query: $query', e);
      return [];
    } on FormatException catch (e) {
      _logger.e('Invalid JSON format in response for query: $query', e);
      return [];
    } on Exception catch (e) {
      _logger.e('Unexpected error occurred for query: $query', e);
      return [];
    }
  }
}