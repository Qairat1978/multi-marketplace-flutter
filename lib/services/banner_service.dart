import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/banner_model.dart';

class BannerService {
  final String baseUrl =
      "https://apad5zf5wf.execute-api.eu-central-1.amazonaws.com/prod";

  Future<List<BannerModel>> getBanners() async {
    final response = await http.get(Uri.parse("$baseUrl/ads"));

    final data = jsonDecode(response.body);

    final List items = data['items'];

    return items.map((e) => BannerModel.fromMap(e)).toList();
  }
}
