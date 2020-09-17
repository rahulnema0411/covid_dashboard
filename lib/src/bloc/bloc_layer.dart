import 'package:covid_dashboard/src/models/list_card.dart';
import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class BlocLayer {
  final _repository = Repository();
  final _dataFetcher = PublishSubject<ListCard>();
  final _responseFetcher = PublishSubject<http.Response>();

  Observable<ListCard> get data => _dataFetcher.stream;
  Observable<http.Response> get response => _responseFetcher.stream;

  fetchAllData() async {
    ListCard _listCard = await _repository.fetchAllData();
    _dataFetcher.sink.add(_listCard);
    http.Response data = _repository.getData();
   _responseFetcher.sink.add(data);
  }

  dispose() {
    _dataFetcher.close();
    _responseFetcher.close();
  }
}

final bloc = BlocLayer();
