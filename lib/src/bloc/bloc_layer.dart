import 'package:bloc/bloc.dart';
import 'package:covid_dashboard/src/models/card_data.dart';
import 'package:covid_dashboard/src/resources/repository.dart';
import 'package:equatable/equatable.dart';

class DataEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchDataEvent extends DataEvent {}

class State extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DataIsLoadingState extends State {}

class DataIsLoadedState extends State {
  final List<CardData> _list;

  List<CardData> get list => _list;

  DataIsLoadedState(this._list);
  @override
  // TODO: implement props
  List<Object> get props => [_list];
}

class DataIsNotLoadedState extends State {}

class BlocLayer extends Cubit<DataEvent> {
  Repository repository;

  BlocLayer(DataEvent state, this.repository) : super(state);

  State get initialState => DataIsLoadingState();

  Stream<State> mapEventToState(DataEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchDataEvent) {
      yield DataIsLoadingState();

      try {
        List<CardData> list = await repository.getData();
        yield DataIsLoadedState(list);
      } catch (Exception) {
        yield DataIsNotLoadedState();
      }
    }
  }
}
