import 'package:flutter/material.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/widgets/catalog/catalog_widget.dart';
import 'package:tobetoapp/widgets/drawer.dart';

bool aramaYapiliyorMu = false;

Future<void> ara(String aramaKelimesi) async {
  print("Ara : $aramaKelimesi");
}

class Catalog extends StatefulWidget {
  const Catalog({Key? key,}) : super(key: key);
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMenu(),
        appBar: AppBar(
          title: aramaYapiliyorMu
              ? TextField(
                  decoration: const InputDecoration(hintText: "Ara"),
                  onChanged: (aramaSonucu) {
                    ara(aramaSonucu);
                  },
                )
              : const Text("Katalog"),
          actions: [
            aramaYapiliyorMu
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        aramaYapiliyorMu = false;
                      });
                    },
                    icon: const Icon(Icons.clear))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        aramaYapiliyorMu = true;
                      });
                    },
                    icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.filter_list_rounded))
          ],
        ),
        body: ListView.builder(
          itemCount: catalogList.length,
          itemBuilder: (ctx, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: CatalogWidget(catalogModel: catalogList[index]),
          ),
        ));
  }
}
