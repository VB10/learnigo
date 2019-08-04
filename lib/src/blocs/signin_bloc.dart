import 'package:learnigo/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class SigninBloc {
  final _repository = Repository();
  final _userFetcher = PublishSubject<String>();

  Observable<String> get getDisplayName => _userFetcher.stream;

  fetchUser() async {
    String displayName = await _repository.getGoogleUser();
    if (displayName == null) {
      _userFetcher.addError(null);
    } else {
      _userFetcher.sink.add(displayName);
    }
  }

  void dispose() {
    _userFetcher.close();
  }
}

final signinBloc = SigninBloc();
