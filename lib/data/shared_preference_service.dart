import 'package:flutterassignment/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  SharedPreferenceService() {
    init();
  }
  static SharedPreferences? _prefs;
  static const String _response = "response";

  void init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set response(MovieSearchResponse response) =>
      _prefs?.setString(_response, response.toJson());

  Future<MovieSearchResponse?> getResponse() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
    String? json = _prefs?.getString(_response);
    if (json != null)
      return MovieSearchResponse.fromJson(json);
    else
      return null;
  }
}
