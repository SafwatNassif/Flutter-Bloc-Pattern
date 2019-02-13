import '../models/post_item.dart';
import '../resouces/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/loader_state.dart';

class JsonBloc {
  final _repository = Repository();

  final _streamOfJsonList = PublishSubject<List<JsonItem>>();
  final _state = BehaviorSubject<StateLoader>();

  Observable<List<JsonItem>> get jsonList => _streamOfJsonList.stream;
  get state => _state.stream;


  fetchAllPost() async {
    _state.add(StateLoader.loading);

    List<JsonItem> list = await _repository.getItem();
    _streamOfJsonList.add(list);

    _state.add(StateLoader.notLoading);
  }

  dispose() {
    _state.close();
    _streamOfJsonList.close();
  }
}
