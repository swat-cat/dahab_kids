import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class RestClient {
  final _dio = Dio();
  final _connectivity = Connectivity();
  String _baseUrl;

  RestClient(this._baseUrl) {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      // Add other headers if needed
    };
  }

  Future<bool> _isConnected() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  String _getFullUrl(String endpointOrUrl) {
    // Check if the provided endpointOrUrl is a full URL or just an endpoint
    if (endpointOrUrl.startsWith('http://') ||
        endpointOrUrl.startsWith('https://')) {
      return endpointOrUrl;
    } else {
      return '$_baseUrl$endpointOrUrl';
    }
  }

  dynamic _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout';
      case DioExceptionType.sendTimeout:
        return 'Send timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.badResponse:
        return 'Received invalid status code: ${e.response?.statusCode}';
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.unknown:
        return 'Connection failed due to internet issues';
      default:
        return 'Something went wrong';
    }
  }

  Future<dynamic> get(String endpointOrUrl,
      {Map<String, dynamic>? queryParams}) async {
    if (!await _isConnected()) {
      throw Exception('No Internet connection');
    }

    try {
      final response = await _dio.get(
        _getFullUrl(endpointOrUrl),
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return 'Unexpected error: $e';
    }
  }
}
