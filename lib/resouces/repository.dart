import 'json_item_request.dart';
import '../models/post_item.dart';

class Repository{

  final jsonItemResponse = ItemApi();
  Future<List<JsonItem>> getItem() => jsonItemResponse.getPost();


}