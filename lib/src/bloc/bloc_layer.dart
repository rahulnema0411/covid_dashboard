import 'package:covid_dashboard/src/models/list_card.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class BlocLayer {
  final _repository = Repository();
  final _dataFetcher = PublishSubject<ListCard>();

  Observable<ListCard> get data => _dataFetcher.stream;

  fetchAllData() async {
    ListCard _listCard = await _repository.fetchAllData();
    _dataFetcher.sink.add(_listCard);
  }

  dispose() {
    _dataFetcher.close();
  }
}

final bloc = BlocLayer();
