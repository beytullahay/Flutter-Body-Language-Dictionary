import 'package:beden_dili_sozlugu/viewmodels/meaning_list_view_model.dart';
import 'package:beden_dili_sozlugu/widgets/mean_list.dart';
import 'package:beden_dili_sozlugu/widgets/sign_language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeanListPage extends StatefulWidget {
  const MeanListPage({Key? key}) : super(key: key);

  @override
  _MeanListPageState createState() => _MeanListPageState();
}

class _MeanListPageState extends State<MeanListPage> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MeaningListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'images/res.png',
          fit: BoxFit.contain,
          height: 50,
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue[50]),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Türkçe Sözlükte Ara',
                    suffixIcon: InkWell(
                      child: const Icon(Icons.search),
                      onTap: () {
                        if (_controller.text.isNotEmpty) {
                          vm.getMeanings(_controller.text);
                        }
                      },
                    ),
                    border: InputBorder.none, // alt çizgiyi yok ettik
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),
            ),
            getWidgetByStatus(vm)
          ],
        ),
      ),
    );
  }

  getWidgetByStatus(MeaningListViewModel vm) {
    switch (vm.status.index) {
      case 0:
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Opacity(opacity: 0.1, child: Image.asset('images/res.png')),
        );
      case 1:
        return const Center(
          child: SizedBox(
            child: CircularProgressIndicator(),
            height: 50,
            width: 50,
          ),
        );
      case 2:
        return const Text('Herhangi bir sonuç bulunamadı',
            style: TextStyle(fontSize: 18));
      default:
        return MeanList(
          meaningViewModel: vm.meaningViewModel,
          signLanguage: SignLanguage(word: vm.meaningViewModel.word),
        );
    }
  }
}
