import 'dart:convert';

import 'package:flutter_demo/models/photo.dart';
import 'package:http/http.dart' as http;

class Repositories {
    static Future<List<Photo>> getPhotos() async {
        String url = "https://jsonplaceholder.typicode.com/photos";
        http.Response response = await http.get(Uri.parse(url));
        List<Photo> result = [];
        if(response.statusCode == 200 && response.body.isNotEmpty) {
            List<dynamic> list = jsonDecode(response.body);
            for(Map<String, dynamic> item in list) {
                result.add(Photo.from(item));
            }
        }
        return result;
    }
}