abstract class ProductEvent {
  const ProductEvent();
}

class GetProductsEvent extends ProductEvent {
  const GetProductsEvent();
}

class SearchProducts extends ProductEvent {
  final String query;

  const SearchProducts(this.query);
} 