import 'package:bloc/bloc.dart';
import 'package:tobetoapp/constants/constants_firabase.dart';
import 'package:tobetoapp/models/modelcatolag.dart';
import 'catalog_event.dart';
import 'catalog_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogLoading()) {
    on<LoadCatalog>(_onLoadCatalog);
  }

  Future<void> _onLoadCatalog(
      LoadCatalog event, Emitter<CatalogState> emit) async {
    emit(CatalogLoading());
    try {
      final catalogList = await _getCatalogListlist();
      emit(CatalogLoaded(catalogList));
    } catch (e) {
      emit(CatalogError(e.toString()));
    }
  }

  Future<List<ModelCatalog>> _getCatalogListlist() async {
    final userDocRef = FirebaseFirestore.instance.collection(ConstanstFirebase.CATALOG_LIST);

    var querySnapshot = await userDocRef.get();

    final catalogList = querySnapshot.docs.map((doc) {
      final data = doc.data();
      return ModelCatalog.fromJson(data);
    }).toList();

    catalogList.sort((a, b) {
      return a.date.compareTo(b.date);
    });

    return catalogList;
  }
}
