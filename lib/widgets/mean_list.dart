import 'package:beden_dili_sozlugu/viewmodels/meaning_view_model.dart';
import 'package:beden_dili_sozlugu/widgets/sign_language.dart';
import 'package:flutter/material.dart';

class MeanList extends StatelessWidget {
  final MeaningViewModel meaningViewModel;
  final SignLanguage signLanguage;
  const MeanList(
      {Key? key, required this.meaningViewModel, required this.signLanguage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          // Aranılan kelimenin sayfadaki tasarımı.
          meaningViewModel.word,
          style: const TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        // kelimenin anlamının yazıldığı yer ve numaları
        ListView.builder(
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: meaningViewModel.meanings.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: Text(
                    '${index + 1}. ${meaningViewModel.meanings[index]}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            }),
        signLanguage
      ],
    );
  }
}
