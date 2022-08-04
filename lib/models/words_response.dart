class WordsResponse {
  List<MeaningList>? meaningList;
  WordsResponse({this.meaningList});

  WordsResponse.fromJson(Map<String, dynamic> json) {
    // API den boş gelirse hata vermiyor. Onun için burada kontrol ediyoruz.
    if (json['anlamlarListe'] != null) {
      // eğer boş değilse
      meaningList = [];
      json['anlamlarListe']
          .forEach((a) => meaningList!.add(MeaningList.fromJson(a)));
    }
  }
}

class MeaningList {
  String? anlam;

  MeaningList({this.anlam});

  MeaningList.fromJson(Map<String, dynamic> json) {
    anlam = json['anlam'];
  }
}
