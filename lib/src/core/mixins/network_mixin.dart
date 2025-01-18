import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

mixin NetworkMixin {
  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final httpClient = IOClient(ioc);

    return await httpClient.get(Uri.parse(endpoint), headers: headers);
  }

  Future<http.Response> post(
    String endpoint, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);

    final response = await http.post(
      Uri.parse(endpoint),
      headers: headers,
      encoding: encoding,
      body: body,
    );

    return response;
  }

  Future<http.Response> put(
    String endpoint, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);

    final response = await http.put(
      Uri.parse(endpoint),
      headers: headers,
      encoding: encoding,
      body: body,
    );

    return response;
  }

  Future<http.Response> patch(
    String endpoint, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);

    final response = await http.put(
      Uri.parse(endpoint),
      headers: headers,
      encoding: encoding,
      body: body,
    );

    return response;
  }

  Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);

    final response = await http.delete(
      Uri.parse(endpoint),
      headers: headers,
      encoding: encoding,
      body: body,
    );

    return response;
  }
}
