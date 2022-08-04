import 'package:flutter/material.dart';

// Giflerin listelendiği sayfa
class SignLanguage extends StatelessWidget {
  final String word;
  const SignLanguage({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SizedBox(
            width: width,
            // gif tasarımı
            height: height * 0.12,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: word.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 88,
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(
                                  'https://sozluk.gov.tr/assets/img/isaret/${word[index]}.gif'),
                            ),
                          ),
                        ),
                        // aranılan kelimenin gif altındaki yazısı.
                        Text(
                          word[index].toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue),
                        )
                      ],
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
