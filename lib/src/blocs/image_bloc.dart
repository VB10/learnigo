import 'package:learnigo/src/models/image_model.dart';
import 'package:learnigo/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ImageBloc {
  final _repository = Repository();
  final _imageFetcher = PublishSubject<UnSplashModel>();

  Observable<UnSplashModel> get getImage => _imageFetcher.stream;

  fetchImage(String word) async {
    UnSplashModel imageModel = await _repository.getImageWord(word);
    if (imageModel == null) {
      _imageFetcher.addError(null);
    } else {
      _imageFetcher.sink.add(imageModel);
    }
  }

  void dispose() {
    _imageFetcher.close();
  }
}

final imageBloc = ImageBloc();
