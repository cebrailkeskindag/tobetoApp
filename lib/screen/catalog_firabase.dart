import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetoapp/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobetoapp/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobetoapp/blocs/catalog_bloc/catalog_state.dart';
import 'package:tobetoapp/models/modelcatolag.dart';
import 'package:tobetoapp/widgets/catalog/catalog_widget.dart';

class CatalogFirebase extends StatelessWidget {
  const CatalogFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CatalogBloc'u kullanarak verileri yükleyin
    context.read<CatalogBloc>().add(LoadCatalog());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog Page'),
      ),
      body: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          // CatalogLoaded durumunda, verileri ekranda gösterin
          if (state is CatalogLoaded) {
            return ListView.builder(
              itemCount: state.catalogs.length,
              itemBuilder: (context, index) {
                // Her bir ModelCatalog öğesini ListTile olarak gösterin
                final catalog = state.catalogs[index];
                return CatalogWidget(catalogModel: catalog);
              },
            );
          }
          // Diğer durumlar için uygun görsel geri dönüş sağlayın
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
