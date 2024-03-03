import 'package:tobetoapp/models/modelcatolag.dart';

abstract class CatalogState {}

class CatalogLoading extends CatalogState {}

class CatalogLoaded extends CatalogState {
  final List<ModelCatalog> catalogs;

  CatalogLoaded(this.catalogs);
}

class CatalogError extends CatalogState {
  final String message;

  CatalogError(this.message);
}