import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_products.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc({required this.getProducts}) : super(const ProductInitial()) {
    on<GetProductsEvent>(_onGetProducts);
    on<SearchProducts>(_onSearchProducts);
  }

  Future<void> _onGetProducts(
    GetProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());
    final result = await getProducts(NoParams());
    result.fold(
      (failure) => emit(const ProductError(message: 'Failed to load products')),
      (products) => emit(
        ProductLoaded(
          products: products,
          filteredProducts: products,
        ),
      ),
    );
  }

  Future<void> _onSearchProducts(
    SearchProducts event,
    Emitter<ProductState> emit,
  ) async {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final filteredProducts = currentState.products
          .where((product) =>
              product.title.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(ProductLoaded(
        products: currentState.products,
        filteredProducts: filteredProducts,
        searchQuery: event.query,
      ));
    }
  }
} 