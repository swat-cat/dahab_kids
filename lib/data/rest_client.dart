import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../domain/models/resource.dart';

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

  Future<Resource<T>> get<T>(String endpointOrUrl,
      {Map<String, dynamic>? queryParams}) async {
    if (!await _isConnected()) {
      return Resource.noConnection('No Internet connection');
    }

    try {
      final response = await _dio.get<T>(
        _getFullUrl(endpointOrUrl),
        queryParameters: queryParams,
      );
      return Resource.success(response.data as T);
    } on DioException catch (e) {
      return Resource.httpError(_handleError(e));
    } catch (e) {
      return Resource.unknownError('Unexpected error: $e');
    }
  }

  Future<Resource<T>> post<T>(String endpointOrUrl,
      {Map<String, dynamic>? data}) async {
    if (!await _isConnected()) {
      return Resource.noConnection('No Internet connection');
    }

    try {
      final response = await _dio.post<T>(
        _getFullUrl(endpointOrUrl),
        data: data,
      );
      return Resource.success(response.data as T);
    } on DioException catch (e) {
      return Resource.httpError(_handleError(e));
    } catch (e) {
      return Resource.unknownError('Unexpected error: $e');
    }
  }

  String _getFullUrl(String endpointOrUrl) {
    if (endpointOrUrl.startsWith('http://') ||
        endpointOrUrl.startsWith('https://')) {
      return endpointOrUrl;
    } else {
      return '$_baseUrl$endpointOrUrl';
    }
  }

  String _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
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
}
