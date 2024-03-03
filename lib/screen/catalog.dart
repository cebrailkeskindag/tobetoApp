import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoapp/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobetoapp/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobetoapp/blocs/catalog_bloc/catalog_state.dart';
import 'package:tobetoapp/datas/datas.dart';
import 'package:tobetoapp/screen/catalog_firabase.dart';
import 'package:tobetoapp/widgets/catalog/catalog_widget.dart';
import 'package:tobetoapp/widgets/homepage/drawer.dart';

bool aramaYapiliyorMu = false;

Future<void> ara(String aramaKelimesi) async {
  print("Ara : $aramaKelimesi");
}

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<CatalogBloc>().add(LoadCatalog());
    return Scaffold(
      endDrawer: const DrawerMenu(),
      appBar: AppBar(
          /*  title: aramaYapiliyorMu
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
        ],*/
          ),
      body: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          // CatalogLoaded durumunda, verileri ekranda gösterin
          if (state is CatalogLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/hs3.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "Öğrenmeye başla !",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            hintText: "Eğitim arayın...",
                            hintStyle: const TextStyle(fontSize: 18),
                            prefixIcon: const Icon(Icons.search),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black38,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            minimumSize: const Size(300, 40),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Filtrele",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.catalogs.length,
                    itemBuilder: (context, index) {
                      
                      final catalog = state.catalogs[index];
                      return CatalogWidget(catalogModel: catalog);
                    },
                  ),
                ),
                const SizedBox(
                  height: 1,
                )
                
              ],
            );
          }
          
          else if (state is CatalogLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CatalogError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
