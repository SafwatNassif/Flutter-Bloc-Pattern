import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_item.dart';

class ItemApi {

  Future<List<JsonItem>> getPost() async {
    String _url = 'https://jsonplaceholder.typicode.com/posts';

    final _response = await http.get(_url);

    if (_response.statusCode == 200) {
      return (json.decode(_response.body) as List)
          .map((jsonItem) => JsonItem.fromJson(jsonItem))
          .toList();
    }
  }

}
