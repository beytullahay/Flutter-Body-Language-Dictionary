import 'package:beden_dili_sozlugu/viewmodels/meaning_view_model.dart';
import 'package:beden_dili_sozlugu/services/dictionary_service.dart';
import 'package:flutter/material.dart';

// initial ilk ekran.
// loading geçiçi
// notfound veri yok
// success veri var.
enum Status { initial, loading, notfound, success }

class MeaningListViewModel extends ChangeNotifier {
  MeaningViewModel meaningViewModel = MeaningViewModel('', []);
  Status status = Status.initial;

  Future<void> getMeanings(String word) async {
    status = Status.loading;
    notifyListeners();

    List<String> meanings = await DictionaryService().searchWord(word);
    meaningViewModel = MeaningViewModel(word, meanings);

    // eğer liste boş değil ise success. Boş ise notfound
    status = meanings.isNotEmpty ? Status.success : Status.notfound;
    notifyListeners();
  }
}
