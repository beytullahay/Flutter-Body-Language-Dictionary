import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/words_response.dart';

class DictionaryService {
  Future<List<String>> searchWord(String word) async {
    Uri url = Uri.parse('https://sozluk.gov.tr/gts?ara=$word');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // her türlü apiden boş olsada dolu olsada veri geliyor ama yinede yaptık.
      final result = json.decode(response.body);
      List<String> anlamlar = [];
      //dizinin ilk indexinin boş olup olmadığını kontrol ediyoruz.
      if (result[0] != null) {
        WordsResponse kelimelerResponse = WordsResponse.fromJson(result[0]);
        for (MeaningList anlam in kelimelerResponse.meaningList!) {
          anlamlar.add(anlam.anlam!);
        }
      }
      return anlamlar;
    }

    // veri dönmezse hata ver
    throw Exception('Bad Request');
  }
}
