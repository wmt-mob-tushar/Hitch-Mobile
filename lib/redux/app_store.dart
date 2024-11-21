import 'package:hitech_mobile/redux/app_reducer.dart';
import 'package:hitech_mobile/redux/app_state.dart';
import 'package:hitech_mobile/redux/actions/store_action.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AppStore {
  static Store<AppState>? _store;

  static Store<AppState>? get store => _store;

  static Future<Store<AppState>> init() async {
    final persistor = Persistor(
      storage: FlutterStorage(location: FlutterSaveLocation.sharedPreferences),
      serializer: JsonSerializer<AppState>(AppState.fromJson),
    );

    // Load initial state
    final initialState = await persistor.load();

    // Create Store with Persistor middleware
    final store = Store<AppState>(
      (state, action) => AppReducer.reducer(state, action as StoreAction),
      initialState: initialState ?? AppState(),
      middleware: [persistor.createMiddleware()],
    );
    _store = store;
    return store;
  }
}
