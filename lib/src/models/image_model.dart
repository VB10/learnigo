class UnSplashModel {
  int _total;
  List<_Results> _results = [];

  UnSplashModel.fromJson(Map<String, dynamic> parsedJson) {
    _total = parsedJson["total"] ?? 0;
    if (parsedJson["total"] != 0) {
      final results = parsedJson["results"];
      List<_Results> temp = [];
      for (var i = 0; i < results.length; i++) {
        _Results _res = _Results(results[i]);
        temp.add(_res);
      }
      _results = temp;
    }
  }

  int get total => _total ?? 0;
  List<_Results> get results => _results;
}

class _Results {
  String _id;
  String _description;
  _Urls _urls;

  _Results(result) {
    _id = result["id"];
    _description = result["description"];
    _urls = _Urls(result["urls"]);
  }

  String get id => _id;
  String get description => _description;
  _Urls get urls => _urls;
}

class _Urls {
  String _raw;
  String _full;
  String _regular;
  String _small;
  String _thumb;

  _Urls(urls) {
    _raw = urls["raw"];
    _full = urls["full"];
    _regular = urls["regular"];
    _small = urls["small"];
    _thumb = urls["thumb"];
  }
  String get raw => _raw;
  String get full => _full;
  String get regular => _regular;
  String get samll => _small;
  String get thumb => _thumb;
}
